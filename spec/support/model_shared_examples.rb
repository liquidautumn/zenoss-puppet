shared_examples "model" do
 it "should return downcase class name as router" do
   subject.router.should == subject.class.to_s.downcase
 end
end
