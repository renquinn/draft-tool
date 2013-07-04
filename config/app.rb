class App < Configurable # :nodoc:
  # Settings in config/app/* take precedence over those specified here.
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
end
