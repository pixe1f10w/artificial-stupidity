# encoding: utf-8

class ArtificialStupidity < Adhearsion::CallController
  def initialize *args
    # letters in the right order (according to russian phone keyboard)
    @letters = { ch: 7, f: 7, k: 4, r: 6, sh: 8, softness_mark: 9, v: 2, z: 3 }
    @backup = @letters
    #@app_path << "#{File.expand_path( '..', File.dirname( File.dirname( __FILE__ ) ) )}"
    @app_path = Dir.pwd
    super *args
  end

  def play *args
    super *args
    sleep 0.4
  end

  def run
    answer
    reset
    greetings

    loop do
      update_letter
      collect_attempt
      verify_attempt
    end
  end

  def greetings
    play get_filepath 'hello.wav'
    play get_filepath 'lets_play.wav'
  end

  def random_letter
    @letters.keys.sample
  end

  def get_filepath filename
    @app_path + "/samples/#{filename}"
  end

  def collect_attempt
    play get_filepath "where_is.wav"
    result = ask get_filepath( "letters/" + @letter.to_s + ".wav" ), limit: 1, timeout: 10
    @attempt = result.response
  end

  def update_letter
    @letter = random_letter
  end

  def verify_attempt
    if attempt_correct?
      play get_filepath( 'right.wav' )
      play get_filepath( 'bye.wav' )
      hangup
    else
      play get_filepath( 'wrong.wav' )
      play get_filepath( 'try_again.wav' )
      reset
    end
  end

  def attempt_correct?
    unless @attempt.empty?
      @attempt.to_i == @letters[ @letter ].to_i
    else
      play get_filepath( 'bye.wav' )
      hangup
    end
  end

  def reset
    @attempt, @letter = '', ''
    # a bit of weird martian logic here :)
    if Random.rand( 0..5 ) != 4
      @letters = Hash[ @letters.keys.zip @letters.values.shuffle ]
    else
      @letters = @backup
    end
  end
end
