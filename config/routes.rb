Rails.application.routes.draw do
  match 'panic', to: 'incidents#report', via: [ :post, :options]
  match 'incidents/report', to: 'incidents#report', via: [ :post, :options]
  get 'heatmap', to: 'incidents#heatmap', :as=>'heatmap'
end
