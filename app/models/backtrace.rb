class Backtrace < ApplicationRecord
  belongs_to :backtraceable, polymorphic: true, optional: true

  serialize :backtrace, JSON

  def app_backtrace(lines = 10)
    @app_backtrace ||=
      Array(backtrace)[0..4]
        select {|bt| bt.starts_with?("*") }
        #.delete_if {|bt| bt.include?("vendor/bundle") }
        #.map {|bt| bt[1..-1] }
  end
end
