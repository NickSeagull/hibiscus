using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace butler
{
    public partial class ButlerHome : Page
    {
        public ButlerHome()
        {
            InitializeComponent();
        }

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {
            var butlerReport = new ButlerReport(this.peopleListBox.SelectedItem);
            this.NavigationService.Navigate(butlerReport);
        }
    }
}
