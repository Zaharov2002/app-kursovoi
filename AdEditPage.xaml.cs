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
    /// Логика взаимодействия для AdEditPage.xaml
    /// </summary>
    public partial class AdEditPage : Page
    {
        private film _currentfilm = new film();
        
        public AdEditPage(film selectedfilm)
        {
            InitializeComponent();
            if (selectedfilm != null)
                _currentfilm = selectedfilm;
              
            DataContext = _currentfilm;
            ComboGenres.ItemsSource = filmsEntities.GetContext().Genre.ToList();
            ComboCountries.ItemsSource = filmsEntities.GetContext().Country.ToList();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentfilm.film1))
                errors.AppendLine("Не указано название");
            if (_currentfilm.Genre == null)
                errors.AppendLine("Выберите жанр");
            if (_currentfilm.Country == null)
                errors.AppendLine("Выберите страну");

            if (errors.Length >0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            if (_currentfilm.id == 0)
                filmsEntities.GetContext().film.Add(_currentfilm);
            try
            {
                filmsEntities.GetContext().SaveChanges();
                MessageBox.Show("Инфрмация сохранена");
                Manager.MainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
