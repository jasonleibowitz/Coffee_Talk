 task :fulfill_requests => :environment do
     desc "Iterate through all unfulfilled requests and match requests with high commonality"
     @requests = Request.where(confirmed:false)
     @requests.each do |request|
      request.schedule_meetups
    end
 end
