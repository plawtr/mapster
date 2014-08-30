Rails.application.routes.draw do
  post 'panic', to: 'incidents#report', :as=>'panic'
  post 'incident/report', to: 'incidents#report', :as=>'report'
  get 'heatmap', to: 'incidents#heatmap', :as=>'heatmap'
end
