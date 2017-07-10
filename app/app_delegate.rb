# frozen_string_literal: true

class AppDelegate
  def application(_application, didFinishLaunchingWithOptions: launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'LGTMotion'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end
end
