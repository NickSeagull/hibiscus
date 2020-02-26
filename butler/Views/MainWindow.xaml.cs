using butler.Services;
using System;
using System.Windows;

namespace butler.Views
{
    public partial class MainWindow : Window
    {
        private void QuitButler(object sender, RoutedEventArgs e)
        {
            Environment.Exit(0);
        }

        private void MainWindow_OnInitialized(object sender, EventArgs e)
        {
            new ButlerCore().Run();
        }
    }
}
