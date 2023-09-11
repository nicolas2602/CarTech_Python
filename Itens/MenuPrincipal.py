import flet as ft
from Itens.components.buttons.MenuButon import MenuButon

class MenuPrincipal(ft.UserControl):
    '''Classe Dedicada a criação do desiner do Menu Principal'''

    def __init__(self, fCadastro, fConsultas, fAnotações, fPagamentos,fGrafico):

        self.__botao1 = MenuButon("Paciente",ft.icons.PERSON, fCadastro)
        self.__botao2 = MenuButon("Agendamento",ft.icons.CALENDAR_MONTH, fConsultas)
        self.__botao3 = MenuButon("Anotações",ft.icons.EDIT_DOCUMENT, fAnotações)
        self.__botao4 = MenuButon("Pagamentos",ft.icons.MONETIZATION_ON, fPagamentos)
        self.__botao5 = MenuButon("Graficos",ft.icons.QUERY_STATS, fGrafico)
        self.__desiner = ft.Column(
            [
                ft.Row([ft.Icon(ft.icons.SELF_IMPROVEMENT_OUTLINED,color=ft.colors.GREEN_900,size=40), ft.Text("PsicoTeck",style=ft.TextThemeStyle.TITLE_LARGE)],alignment="Center"),
                ft.Divider(color=ft.colors.GREEN_900,height=0),

                self.__botao1.build(),
                self.__botao2.build(),
                self.__botao3.build(),
                self.__botao4.build(),
                self.__botao5.build(),
            ],
            expand=False,
            width=150,
            horizontal_alignment= "Center"
        )

    def build(self):
        return self.__desiner

