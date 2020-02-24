using System;
using System.Windows;

namespace butler
{
    public partial class MainWindow : Window
    {
        private void QuitButler(object sender, RoutedEventArgs e)
        {
            Environment.Exit(0);
        } 
    }
}
