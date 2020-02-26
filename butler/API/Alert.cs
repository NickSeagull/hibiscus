using System.Windows;

namespace butler.API
{
    public class Alert
    {
        public void show(string message)
        {
            MessageBox.Show(message, "");
        }

    }
}