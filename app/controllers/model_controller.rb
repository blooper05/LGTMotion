class ModelController
  attr_reader :page_data

  def initialize
    @page_data = 10.times.to_a
  end

  def viewControllerAtIndex(index, storyboard: storyboard)
    return if page_data.length == 0 || page_data.length <= index

    dataViewController = DataViewController.alloc.init
    dataViewController.data_object = { text: page_data[index], index: index}
    dataViewController
  end

  def indexOfViewController(viewController)
    viewController.data_object[:index]
  end

  def pageViewController(pvc, viewControllerBeforeViewController: vc)
    index = indexOfViewController(vc)
    return if (index == 0 || index == -1)
    index -= 1
    viewControllerAtIndex(index, storyboard: vc.storyboard)
  end


  def pageViewController(pvc, viewControllerAfterViewController: vc)
    index = indexOfViewController(vc)
    return if index == -1

    index += 1
    return if index == page_data.length

    viewControllerAtIndex(index, storyboard: vc.storyboard)
  end
end
