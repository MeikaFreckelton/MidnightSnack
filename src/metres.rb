require 'ruby-progressbar'

progressbar = ProgressBar.create(:title => "Fullness level", :total => 10, :progress_mark => "▇", :length => 50, :format => '%p' )


puts 5.times { progressbar.increment; sleep 0.1}
