namespace :game_timers do
  task start: :environment do
    loop do
      Game.where(started: true).each do |game|
        begin
          game.update(seconds_left: game.seconds_left - 1);
          if game.seconds_left <= 0
            game.next_round!
          end
          sleep 0.75
        rescue e => StandardError
          puts e
        end
      end
    end
  end
end
