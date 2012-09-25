require 'headless'

headless = Headless.new #(:display => 99999)
headless.start

at_exit do
  headless.destroy
end

Before do
  headless.video.start_capture
end

After do |scenario|
  # for demo purpose: always record ;-)
  headless.video.stop_and_save(video_path(scenario))

  #  if scenario.failed?
  #    headless.video.stop_and_save(video_path(scenario))
  #  else
  #    headless.video.stop_and_discard
  #  end
end

def video_path(scenario)
  "#{scenario.name.split.join("_")}.mov"
end
