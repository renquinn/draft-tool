class App < Configurable # :nodoc:
  config.name = Rails.application.class.parent.name

  config.default_settings = {
    :attempts => 0.0,
    :completions => 0.0,
    :passing_yards => 0.04,
    :passing_touchdowns => 6.0,
    :interceptions => -2.0,
    :rushes => 0.0,
    :rushing_yards => 0.1,
    :rushing_touchdowns => 6.0,
    :receptions => 1.0,
    :receiving_yards => 0.1,
    :receiving_touchdowns => 6.0,
    :qb_points => 20,
    :rb1_points => 15,
    :rb2_points => 11,
    :wr1_points => 17,
    :wr2_points => 14,
    :flex_points => 12,
    :te_points => 11,
    :k_points => 7,
    :dst_points => 12
  }

  config.dst_points = {
    "Seahawks" => 171,
    "49ers" => 177,
    "Texans" => 166,
    "Bears" => 160,
    "Broncos" => 140,
    "Bengals" => 125,
    "Patriots" => 136,
    "Steelers" => 123,
    "Rams" => 123,
    "Packers" => 126,
    "Ravens" => 117,
    "Cowboys" => 120,
    "Dolphins" => 102,
    "Buccaneers" => 114,
    "Giants" => 104,
    "Falcons" => 100,
    "Chargers" => 106,
    "Browns" => 85,
    "Jets" => 99,
    "Cardinals" => 100
  }

  config.k_points = {
    "Stephen Gostkowski" => 157,
    "Blair Walsh" => 157,
    "Matt Bryant" => 150,
    "Justin Tucker" => 148,
    "Matt Prater" => 144,
    "Phil Dawson" => 144,
    "Randy Bullock" => 141,
    "Josh Brown" => 137,
    "Sebastian Janikowski" => 137,
    "David Akers" => 134,
    "Dan Bailey" => 134,
    "Greg Zuerlein" => 130,
    "Steven Hauschka" => 128,
    "Garrett Hartley" => 127,
    "Robbie Gould" => 125,
    "Mike Nugent" => 124,
    "Mason Crosy" => 121,
    "Lawrence Tynes" => 120,
    "Adam Vinatieri" => 120,
    "Alex Henery" => 117,
    "Shaun Suisham" => 114,
    "Rob Bironas" => 112,
    "Graham Gano" => 112,
    "Kai Forbath" => 109,
    "Jay Feely" => 106,
    "Shayne Graham" => 106,
    "Ryan Succop" => 106
  }
end
