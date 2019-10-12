#import "SceneDelegate.h"
#import "DBDHomePageViewController.h"
#import "DBDMovieViewController.h"
#import "DBDFairViewController.h"
#import "DBDMineViewController.h"
#import "DBDGroupViewController.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    self.window = [[UIWindow alloc] initWithWindowScene:scene];
    
    DBDHomePageViewController *homeViewController = [[DBDHomePageViewController alloc] init];
    DBDFairViewController *fairViewController = [[DBDFairViewController alloc] init];
    DBDMineViewController *mineViewController = [[DBDMineViewController alloc] init];
    DBDGroupViewController *groupViewController = [[DBDGroupViewController alloc] init];
    DBDMovieViewController *movieViewController = [[DBDMovieViewController alloc] init];
    
    UINavigationController * homeNav = [[UINavigationController alloc] initWithRootViewController: homeViewController];
    UINavigationController * fairNav = [[UINavigationController alloc] initWithRootViewController: fairViewController];
    UINavigationController * mineNav = [[UINavigationController alloc] initWithRootViewController: mineViewController];
    UINavigationController * groupNav = [[UINavigationController alloc] initWithRootViewController: groupViewController];
    UINavigationController * movieNav = [[UINavigationController alloc] initWithRootViewController: movieViewController];
    
    NSArray *array = [NSArray arrayWithObjects: homeNav, movieNav, groupNav, fairNav, mineNav, nil];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = array;
    [tabBarController.tabBar setBarTintColor:[UIColor whiteColor]];
    [tabBarController.tabBar setTintColor:[UIColor greenColor]];
    tabBarController.tabBar.unselectedItemTintColor = [UIColor grayColor];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    homeNav.title = @"首页";
    movieNav.title = @"书影音";
    groupNav.title = @"小组";
    mineNav.title = @"我的";
    fairNav.title = @"市集";
    
    UIImage *homeImage = [[UIImage imageNamed:@"shouye.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *homeImageHigh = [[UIImage imageNamed:@"shouye-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [homeNav.tabBarItem setImage:homeImage];
    [homeNav.tabBarItem setImage:homeImageHigh];
    
    
    UIImage *movieImage = [[UIImage imageNamed:@"shu-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *movieImageHigh = [[UIImage imageNamed:@"shu.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [movieNav.tabBarItem setImage:movieImage];
    [movieNav.tabBarItem setImage:movieImageHigh];
    
    UIImage *groupImage = [[UIImage imageNamed:@"quanzi.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *groupImageHigh = [[UIImage imageNamed:@"quanzi-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [groupNav.tabBarItem setImage:groupImage];
    [groupNav.tabBarItem setImage:groupImageHigh];
    
    UIImage *fairImage = [[UIImage imageNamed:@"shichang-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
      UIImage *fairImageHigh = [[UIImage imageNamed:@"shichang.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
      [fairNav.tabBarItem setImage:fairImage];
      [fairNav.tabBarItem setImage:fairImageHigh];
    
    UIImage *mineImage = [[UIImage imageNamed:@"dibudaohanglan--2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *mineImageHigh = [[UIImage imageNamed:@"dibudaohanglan-.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [mineNav.tabBarItem setImage:mineImage];
    [mineNav.tabBarItem setImage:mineImageHigh];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
