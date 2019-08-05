# Write your code here!
require "pry"

#contains and returns a hash nested 
def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16, 
          :points => 22, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 3, 
          :blocks => 1, 
          :slam_dunks => 1, 
        }, 
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14, 
          :points => 12, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 12, 
          :blocks => 12, 
          :slam_dunks => 7, 
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17, 
          :points => 17, 
          :rebounds => 19, 
          :assists => 10, 
          :steals => 3, 
          :blocks => 1, 
          :slam_dunks => 15, 
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19, 
          :points => 26, 
          :rebounds => 11, 
          :assists => 6, 
          :steals => 3, 
          :blocks => 8, 
          :slam_dunks => 5, 
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15, 
          :points => 19, 
          :rebounds => 2, 
          :assists => 2, 
          :steals => 4, 
          :blocks => 11, 
          :slam_dunks => 1, 
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien"=> {
          :number => 4,
          :shoe => 18, 
          :points => 10, 
          :rebounds => 1, 
          :assists => 1, 
          :steals => 2, 
          :blocks => 7, 
          :slam_dunks => 2
        }, 
         "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16, 
          :points => 12, 
          :rebounds => 4, 
          :assists => 7, 
          :steals => 22, 
          :blocks => 15, 
          :slam_dunks => 10, 
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14, 
          :points => 24, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 4, 
          :blocks => 5, 
          :slam_dunks => 5, 
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15, 
          :points => 33, 
          :rebounds => 3, 
          :assists => 2, 
          :steals => 1, 
          :blocks => 1, 
          :slam_dunks => 0, 
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15, 
          :points => 6, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 7, 
          :blocks => 5, 
          :slam_dunks => 12, 
        }
      }
    }
  }
end 


def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if player === player_name
        return stats[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if player === player_name
        return stats[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] === team_name
      return team_data[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams << team_data[:team_name]
  end
  teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] === team_name
      team_data[:players].each do |player, stats|
        numbers << stats[:number]
      end
    end
  end
  numbers
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if player === player_name
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  largest = [0, ""] #[shoe size, player name]
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      size = stats[:shoe]
      if size > largest[0] #checks the shoe size 
        largest[0] = size
        largest[1] = player
      end
    end
  end
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats| #key-value split
      if player === largest[1]
        return stats[:rebounds]
      end
    end
  end
end

def most_points_scored
  scorer = [0, ""] #[points scored, player name]
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      score = stats[:points]
      if score > scorer[0]
        scorer[0] = score
        scorer[1] = player
      end
    end
  end
  scorer[1]
end

def winning_team
  winner = [0, ""] #[points scored, team name]
  game_hash.each do |location, team_data|
    points = 0
    team_data[:players].each do |player, stats|
      points += stats[:points]
    end
    if points > winner[0]
      winner[0] = points
      winner[1] = team_data[:team_name]
    end
  end
  winner[1]
end

def player_with_longest_name
  longest = [0, ""] #[name length, player name]
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      size = player.size() #name length  
      if size > longest[0]
        longest[0] = size
        longest[1] = player
      end
    end
  end
  longest[1]
end

def most_steals #return player name with most steals
  stealer = [0, ""] #[steals made, player name]
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      steal = stats[:steals]
      if steal > stealer[0]
        stealer[0] = steal
        stealer[1] = player
      end
    end
  end
  stealer[1]
end

def long_name_steals_a_ton?
  player_with_longest_name === most_steals
end




