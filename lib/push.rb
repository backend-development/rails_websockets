module Push 

 def faye_uri
    URI.parse("http://#{CONFIG['faye'][Rails.env]['host']}:#{CONFIG['faye'][Rails.env]['port']}/faye")
 end

 def broadcast_stepstone_board(adventure, stepstone)
    # send stepstone
    @stepstone.reload
    @steps = stepstone.steps.all
    html = render_to_string(:partial => 'board', :layout => false)
    channel = adventure_stepstone_path(adventure, stepstone)
    message = {:channel => channel, :data => {:board => html} }
    Rails.logger.warn("posting to channel #{channel} : " + message.to_json)
    Net::HTTP.post_form(faye_uri, :message => message.to_json)
  end

  def broadcast_adventure_board( adventure )
    # reload + send adventure
    @steps = adventure.steps.includes(:stepstone).includes(:user)

    html = render_to_string(:partial => 'adventures/board', :layout => false)
    channel = adventure_path(adventure)
    message = {:channel => channel, :data => {:board => html} }
    Rails.logger.warn("posting to channel #{channel} : " + message.to_json)
    Net::HTTP.post_form(faye_uri, :message => message.to_json)
  end
end
