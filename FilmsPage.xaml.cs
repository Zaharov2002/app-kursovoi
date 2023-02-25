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

namespace app_kursovoi
{
    /// <summary>
    /// Логика взаимодействия для FilmsPage.xaml
    /// </summary>
    public partial class FilmsPage : Page
    {
        public FilmsPage()
        {
            InitializeComponent();
            DGridFilms.ItemsSource = filmsEntities.GetContext().film.ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AdEditPage());
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AdEditPage());
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            filmsEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
        }
    }
}
