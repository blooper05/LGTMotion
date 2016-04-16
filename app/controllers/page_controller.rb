class PageController < UIViewController
  attr_accessor :modelController
  attr_accessor :pageViewController

  def viewDidLoad
    super

    @pageViewController = UIPageViewController.alloc.initWithTransitionStyle(
      UIPageViewControllerTransitionStylePageCurl,
      navigationOrientation: UIPageViewControllerNavigationOrientationHorizontal,
      options:               nil
    )
    @pageViewController.delegate = self

    startingViewController = modelController.viewControllerAtIndex(0, storyboard: nil)
    viewControllers        = [startingViewController]

    @pageViewController.setViewControllers(
      viewControllers,
      direction:  UIPageViewControllerNavigationDirectionForward,
      animated:   false,
      completion: lambda { |a| }
    )
    @pageViewController.dataSource = modelController

    addChildViewController(@pageViewController)
    view.addSubview(@pageViewController.view)

    @pageViewController.didMoveToParentViewController(self)

    view.gestureRecognizers = @pageViewController.gestureRecognizers
  end

  def modelController
    @modelController ||= ModelController.new
  end

  def pageViewController(pvc, spineLocationForInterfaceOrientation: orientation)
    currentViewController = @pageViewController.viewControllers[0]
    viewControllers       = [currentViewController]

    pageViewController.setViewControllers(
      viewControllers,
      direction:  UIPageViewControllerNavigationDirectionForward,
      animated:   true,
      completion: lambda { |a| }
    )

    @pageViewController.doubleSided = false

    UIPageViewControllerSpineLocationMin
  end
end
