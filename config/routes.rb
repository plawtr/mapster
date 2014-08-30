Rails.application.routes.draw do
  post 'panic', to: 'incidents#report', :as=>'panic'
  post 'incidents/report', to: 'incidents#report'
  get 'heatmap', to: 'incidents#heatmap', :as=>'heatmap'
end
