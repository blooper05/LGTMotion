# frozen_string_literal: true

describe "Application 'LGTMotion'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it 'has one window' do
    @app.windows.size.should == 1
  end
end
