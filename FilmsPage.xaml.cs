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
            DGridFilms.ItemsSource = filmsEntities1.GetContext().film.ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AdEditPage((sender as Button).DataContext as film));
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            var filmsForRemoving = DGridFilms.SelectedItems.Cast<film>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить {filmsForRemoving.Count()} элементов?" , "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question)
                == MessageBoxResult.Yes)
            {
               try
                {
                    filmsEntities1.GetContext().film.RemoveRange(filmsForRemoving);
                    filmsEntities1.GetContext().SaveChanges();
                    MessageBox.Show("Данные успешно удалены");

                    DGridFilms.ItemsSource = filmsEntities1.GetContext().film.ToList();
                }
                catch (Exception ex)
                 {
                    MessageBox.Show(ex.Message.ToString());
                } 
            }
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AdEditPage(null));
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            filmsEntities1.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            DGridFilms.ItemsSource = filmsEntities1.GetContext().film.ToList();
        }
    }
}
