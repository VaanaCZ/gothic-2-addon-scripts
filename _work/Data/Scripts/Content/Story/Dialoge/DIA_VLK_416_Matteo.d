// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Matteo_EXIT(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 999;
	condition	= DIA_Matteo_EXIT_Condition;
	information	= DIA_MAtteo_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Matteo_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Matteo_PICKPOCKET (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 900;
	condition	= DIA_Matteo_PICKPOCKET_Condition;
	information	= DIA_Matteo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Matteo_PICKPOCKET_Condition()
{
	C_Beklauen (80, 150);
};
 
FUNC VOID DIA_Matteo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Matteo_PICKPOCKET);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_BACK 		,DIA_Matteo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Matteo_PICKPOCKET_DoIt);
};

func void DIA_Matteo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
	
func void DIA_Matteo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Matteo_Hallo(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_Hallo_Condition;
	information	= DIA_MAtteo_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Matteo_Hallo_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Hallo_Info()
{	
	AI_Output (self, other, "DIA_Matteo_Hallo_09_00"); //Co mogę dla ciebie zrobić?
};

// ************************************************************
// 			  				   Sell What 
// ************************************************************
INSTANCE DIA_Matteo_SellWhat(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_SellWhat_Condition;
	information	= DIA_MAtteo_SellWhat_Info;
	permanent	= FALSE;
	description = "Co sprzedajesz?";
};                       
FUNC INT DIA_Matteo_SellWhat_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_SellWhat_Info()
{	
	AI_Output (other, self, "DIA_Matteo_SellWhat_15_00"); //Co sprzedajesz?
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_01"); //Mogę ci zaproponować wszystko, czego będziesz potrzebować, żeby przetrwać w dziczy. Broń, pochodnie, żywność... nawet pancerz.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_02"); //Mam na stanie coś specjalnego.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_03"); //Pancerz z podwójnie utwardzanej skóry zębacza - nieużywany. Zainteresowany?
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Sklep Mattea znajduje się przy południowej bramie miasta. Można tam kupić oręż, żywność oraz wyposażenie.");
		Knows_Matteo = TRUE;
	};
};

// *********************************************************
// 		  					TRADE 				
// *********************************************************
INSTANCE DIA_Matteo_TRADE (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 800;
	condition	= DIA_Matteo_TRADE_Condition;
	information	= DIA_Matteo_TRADE_Info;
	permanent	= TRUE;
	description = "Pokaż mi swoje towary.";
	Trade		= TRUE;
};                       
FUNC INT DIA_Matteo_TRADE_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};	
};

var int Matteo_TradeNewsPermanent;

FUNC VOID DIA_Matteo_TRADE_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other,self ,"DIA_Matteo_TRADE_15_00"); //Pokaż mi swoje towary.
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	&& (Matteo_TradeNewsPermanent == FALSE)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_01"); //Od czasu jak najemnicy załatwili paladyna Lothara, inspekcje paladynów są coraz bardziej nieprzyjemne.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_02"); //Mam nadzieję, że jak już powieszą mordercę, sytuacja się uspokoi.
	
		Matteo_TradeNewsPermanent = 1;
	};
	if (Kapitel == 5)
	&& (Matteo_TradeNewsPermanent < 2)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_03"); //Wygląda na to, że tym razem paladyni traktują to naprawdę poważnie. Wycofali nawet swoich strażników ze statku.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_04"); //Dobrze, że uzupełniasz zapasy. Kto wie, czy miasto utrzyma się jeszcze tydzień.
	
		Matteo_TradeNewsPermanent = 2;
	};
};

// *********************************************************
// 		  					ARMOR 				
// *********************************************************

//-------------------------------------
	var int Matteo_LeatherBought;
//-------------------------------------

instance DIA_Matteo_LEATHER		(C_INFO)
{
	npc			 = 	VLK_416_Matteo;
	nr			 =  850;
	condition	 = 	DIA_Matteo_LEATHER_Condition;
	information	 = 	DIA_Matteo_LEATHER_Info;
	permanent	 = 	TRUE;
	description	 = 	"Kup skórzany pancerz. Ochrona: broń 25, strzały 20. 250 sztuk złota.";
};

func int DIA_Matteo_LEATHER_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	&& (Matteo_LeatherBought == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Matteo_LEATHER_Info ()
{
	AI_Output (other, self, "DIA_Matteo_LEATHER_15_00"); //Dobra, daj mi pancerz.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 250)
	{	
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_01"); //Na pewno ci się spodoba.

		B_GiveInvItems 	(self, other, ItAr_Leather_L, 1);
		Matteo_LeatherBought = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_02"); //Ten pancerz ma swoją cenę - i jest jej wart. Przyjdź, jak będziesz miał złoto.
	};
};

// ************************************************************
// 			  				Paladine 			E1
// ************************************************************
INSTANCE DIA_Matteo_Paladine(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Paladine_Condition;
	information	= DIA_MAtteo_Paladine_Info;
	permanent	= FALSE;
	description = "Co wiesz o paladynach?";
};                       
FUNC INT DIA_Matteo_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Matteo_Paladine_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Paladine_15_00"); //Co wiesz o paladynach?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_01"); //Od czasu, jak te bydlaki przyszły do miasta, mam same kłopoty.
	AI_Output (self, other, "DIA_Matteo_Paladine_09_02"); //Kiedy ostatnio szedłem do górnego miasta, zatrzymali mnie strażnicy i zapytali, po co tam idę!
	AI_Output (other, self, "DIA_Matteo_Paladine_15_03"); //I?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_04"); //Oczywiście, że mnie wpuścili!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_05"); //Miałem w mieście sklep, kiedy większość z tych nadętych dupków ganiała jeszcze świnie!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_06"); //A wczoraj te bydlaki skonfiskowały połowę mojego towaru!
};

// ************************************************************
// 			  				Confiscated 			E2
// ************************************************************
INSTANCE DIA_Matteo_Confiscated(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Confiscated_Condition;
	information	= DIA_MAtteo_Confiscated_Info;
	permanent	= FALSE;
	description = "Paladyni zabrali twoje towary?";
};                       
FUNC INT DIA_Matteo_Confiscated_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Confiscated_Info()
{	

	AI_Output (other, self, "DIA_Matteo_Confiscated_15_00"); //Paladyni zabrali twoje towary?
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_01"); //Wszystko, co miałem na podwórku.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_02"); //Postawili strażnika przy wejściu na podwórko.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_03"); //Jeśli mi się poszczęści, nie zabiorą mi wszystkiego. Może chociaż zostawią tę zbroję.
};

// ************************************************************
// 			  				HelpMeToOV 			E2
// ************************************************************
INSTANCE DIA_Matteo_HelpMeToOV(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeToOV_Condition;
	information	= DIA_MAtteo_HelpMeToOV_Info;
	permanent	= FALSE;
	description = "Czy możesz mi pomóc dostać się do górnego miasta?";
};                       
FUNC INT DIA_Matteo_HelpMeToOV_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeToOV_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_00"); //Możesz mi pomóc dostać się do górnego miasta?
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_01"); //Co? Co będziesz TAM robił?
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_02"); //Mam ważną wiadomość...
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_03"); //No, no, no. Próbowałeś przemknąć się koło strażników?

	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_04"); //Człowieku, zapomnij!
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_05"); //To TYPOWE dla tych żebraków!
	}
	else
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_06"); //Nie rozumiem, dlaczego miałbym w ogóle próbować.
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_07"); //Pewnie masz rację.
	};
	
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_08"); //Nie wiem, jak WAŻNA jest twoja wiadomość - nie obchodzi mnie to.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_09"); //Ale nawet gdybyś powiedział im, że statek pełen orków wpłynął właśnie do portu i tak by cię odesłali.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_10"); //Bo mają swoje ROZKAZY.
};

// ************************************************************
// 			  				HelpMeNow 			E3
// ************************************************************

func void B_Matteo_Preis()
{
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_01"); //Wygląda na to, że to dla ciebie ważne.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_02"); //Pytanie tylko, JAK ważne?
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_03"); //Do czego zmierzasz?
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_04"); //Mogę ci pomóc - było nie było jestem tu jednym z najbardziej wpływowych ludzi.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_05"); //Ale to cię będzie kosztować.
};


INSTANCE DIA_Matteo_HelpMeNow(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeNow_Condition;
	information	= DIA_MAtteo_HelpMeNow_Info;
	permanent	= FALSE;
	description = "No to jak? Możesz mi pomóc dostać się do górnego miasta?";
};                       
FUNC INT DIA_Matteo_HelpMeNow_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeToOV))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeNow_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_00"); //No to jak? Możesz mi pomóc dostać się do górnego miasta?
	B_Matteo_Preis();
};

// ************************************************************
// 			  		LEHRLING als GILDE X
// ************************************************************
INSTANCE DIA_Matteo_LehrlingLater(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_LehrlingLater_Condition;
	information	= DIA_MAtteo_LehrlingLater_Info;
	permanent	= FALSE;
	description = "Pomóż mi zostać czeladnikiem u jednego z mistrzów!";
};                       
FUNC INT DIA_Matteo_LehrlingLater_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
func VOID DIA_Matteo_LehrlingLater_Info()
{	
	AI_Output (other, self, "DIA_Matteo_LehrlingLater_15_00"); //Pomóż mi zostać czeladnikiem u jednego z mistrzów.
	B_Matteo_Preis();
};
	
// ************************************************************
// 			  		PriceOfHelp  (MISSION)			E4
// ************************************************************
INSTANCE DIA_Matteo_PriceOfHelp(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_PriceOfHelp_Condition;
	information	= DIA_MAtteo_PriceOfHelp_Info;
	permanent	= FALSE;
	description = "Co chcesz w zamian za pomoc?";
};                       
FUNC INT DIA_Matteo_PriceOfHelp_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_PriceOfHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_15_00"); //Co chcesz w zamian za pomoc?
	AI_Output (self, other, "DIA_Matteo_PriceOfHelp_09_01"); //100 sztuk złota.
	
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "To cholernie dużo...", DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "Ty pijawko!", DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output (self, other, "B_Matteo_RegDichAb_09_00"); //Spokojnie! Nie TWOJE złoto miałem na myśli.
	AI_Output (other, self, "B_Matteo_RegDichAb_15_01"); //Ale.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_02"); //Właściwie, chodzi mi o MOJE złoto.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_03"); //Gritta, bratanica stolarza, od dawna jest mi winna pieniądze.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_04"); //Ta mała lisica kręci się po okolicy w nowych ciuszkach - a to znaczy, że ma pieniądze.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_05"); //Wywlekłbym jej te pieniądze z gardła, ale Mistrz Thorben - stolarz - to bardzo wpływowy człowiek.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_06"); //Załatw mi te pieniądze, to ci pomogę.
	
	MIS_Matteo_Gold = LOG_RUNNING;
	Log_CreateTopic (Topic_Matteo,LOG_MISSION);
	Log_SetTopicStatus	(Topic_Matteo,LOG_RUNNING);
	B_LogEntry (Topic_Matteo,"Jeśli Matteo dostanie od siostrzenicy stolarza Thorbena, Gritty, 100 sztuk złota, które jest mu winna, pomoże mi dostać się do górnego miasta.");
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Cutthroat_15_00"); //Ty pijawko!
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Wow_15_00"); //To cholernie dużo...
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

// ************************************************************
// 			  				WoGritta 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoGritta(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_WoGritta_Condition;
	information	= DIA_MAtteo_WoGritta_Info;
	permanent	= FALSE;
	description = "Gdzie znajdę tę Grittę?";
};                       
FUNC INT DIA_Matteo_WoGritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (Gritta.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoGritta_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoGritta_15_00"); //Gdzie znajdę tę Grittę?
	AI_Output (self, other, "DIA_Matteo_WoGritta_09_01"); //Tak jak powiedziałem, to siostrzenica stolarza. Jego dom stoi przy tej ulicy. To ostatni budynek po prawej stronie przed kuźnią.
};

// ************************************************************
// 			  				GoldRunning 			E5
// ************************************************************
INSTANCE DIA_Matteo_GoldRunning(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 500;
	condition	= DIA_Matteo_GoldRunning_Condition;
	information	= DIA_MAtteo_GoldRunning_Info;
	permanent	= TRUE;
	description = "Oto twoje 100 sztuk złota!";
};                       
FUNC INT DIA_Matteo_GoldRunning_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& ( Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) || Npc_IsDead(Gritta) )
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_GoldRunning_Info()
{	
	AI_Output (other, self, "DIA_Matteo_GoldRunning_15_00"); //Oto twoje 100 sztuk złota!
	
	//EXIT IF...
	
	if (Npc_IsDead(Gritta))
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_01"); //Na tym złocie jest krew Gritty! Nie kazałem ci jej zabijać!
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_02"); //Nie chcę mieć z tym nic wspólnego. Możesz zapomnieć o naszej umowie. Nigdy więcej nie próbuj ze mną rozmawiać.
		MIS_Matteo_Gold = LOG_FAILED;
		B_CheckLog();
		AI_StopProcessInfos	(self);
		return;
	};
	
	// FUNC

	if (B_GiveInvItems (other, self, itmi_gold, 100))
	{
		if (Npc_HasItems(Gritta, itmi_gold) < 100)
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_03"); //I co? Robiła jakieś problemy?
			AI_Output (other, self, "DIA_Matteo_GoldRunning_15_04"); //Nic, o czym warto wspominać.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_05"); //Świetnie! Dotrzymałeś swojej części umowy.
		}
		else
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_06"); //Chcesz za nią zapłacić? Hmmm - wolałbym, żebyś to z niej wycisnął!
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_07"); //Mimo to 100 sztuk złota, to ciągle 100 sztuk złota.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_08"); //Dotrzymałeś swojej części umowy.
		};
		
		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP (XP_Matteo_Gold);
	}
	else
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_09"); //Liczenie nie jest twoją najmocniejszą stroną, co?
	};
};

// ************************************************************
// 		  				Stimme abgeben		E5 - PERM
// ************************************************************

instance DIA_Matteo_Zustimmung(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_Zustimmung_Condition;
	information	= DIA_MAtteo_Zustimmung_Info;
	permanent	= TRUE;
	description = "Pomóż mi zostać czeladnikiem u jednego z mistrzów!";
};          
var int   DIA_Matteo_Zustimmung_perm;          
FUNC INT DIA_Matteo_Zustimmung_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& ( (MIS_Matteo_Gold == LOG_RUNNING) || (MIS_Matteo_Gold == LOG_SUCCESS) )
	&& (Player_IsApprentice == APP_NONE)
	&& (DIA_Matteo_Zustimmung_perm == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Zustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Zustimmung_15_00"); //Pomóż mi zostać czeladnikiem u jednego z mistrzów!
	
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_01"); //Nie martw się. Dotrzymam umowy.
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_02"); //Inni mistrzowie usłyszą o tobie same dobre rzeczy.
		
		B_GivePlayerXP (XP_Zustimmung);
		B_LogEntry (Topic_Lehrling,"Jeśli zechcę zostać czeladnikiem, Matteo udzieli mi swojego poparcia.");
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else //LOG_RUNNING
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_03"); //Nie wszystko na raz. Najpierw wywiąż się z umowy i przynieś mi złoto!
	};
};

// ************************************************************
// 			  				HowCanYouHelp 			E4
// ************************************************************
INSTANCE DIA_Matteo_HowCanYouHelp (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_HowCanYouHelp_Condition;
	information	= DIA_MAtteo_HowCanYouHelp_Info;
	permanent	= FALSE;
	description = "Na czym DOKłADNIE ma polegać twoja pomoc?";
};                       
FUNC INT DIA_Matteo_HowCanYouHelp_Condition()
{	
	if ((Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater)))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HowCanYouHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HowCanYouHelp_15_00"); //Na czym DOKŁADNIE ma polegać twoja pomoc?
	AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_01"); //To dość proste. Wykorzystam swoje wpływy, żeby jeden z mistrzów przyjął cię na czeladnika.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_02"); //A wtedy praktycznie rzecz biorąc, będziesz obywatelem miasta i górna jego część stanie przed tobą otworem. Poza tym będziesz mógł coś zarobić.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Matteo może mi pomóc zostać czeladnikiem u jednego z mistrzów.");
};	

// ************************************************************
// 			  				WoAlsLehrling 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoAlsLehrling (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_WoAlsLehrling_Condition;
	information	= DIA_MAtteo_WoAlsLehrling_Info;
	permanent	= FALSE;
	description = "Kto w takim razie może przyjąć mnie na czeladnika?";
};                       
FUNC INT DIA_Matteo_WoAlsLehrling_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoAlsLehrling_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoAlsLehrling_15_00"); //Kto w takim razie może przyjąć mnie na czeladnika?
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_01"); //Może to być którykolwiek z mistrzów mieszkających przy głównej ulicy.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_02"); //Harad kowal, Bosper łuczarz, Thorben stolarz albo Constantino alchemik.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_03"); //Jeden z nich musi cię przyjąć.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_04"); //Ważne jednak, żeby zgodzili się na to pozostali mistrzowie. W Khorinis panuje taki zwyczaj.
	
	Log_CreateTopic (Topic_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (Topic_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Mogę zostać czeladnikiem u łuczarza Bospera, kowala Harada, stolarza Thorbena lub alchemika Constantina.");
	B_LogEntry (Topic_Lehrling,"Zanim zostanę czeladnikiem, muszę zyskać poparcie pozostałych mistrzów.");
};
// ************************************************************
// 			  				WieZustimmung 			E6
// ************************************************************
INSTANCE DIA_Matteo_WieZustimmung (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 5;
	condition	= DIA_Matteo_WieZustimmung_Condition;
	information	= DIA_MAtteo_WieZustimmung_Info;
	permanent	= FALSE;
	description = "Jak uzyskam zgodę pozostałych mistrzów?";
};                       
FUNC INT DIA_Matteo_WieZustimmung_Condition()
{	
	if ( Npc_KnowsInfo (other,DIA_Matteo_WoAlsLehrling) || Npc_KnowsInfo (other,DIA_Matteo_WarumNichtBeiDir) )
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WieZustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WieZustimmung_15_00"); //Jak uzyskam zgodę pozostałych mistrzów?
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_01"); //Musisz ich do tego przekonać. Idź z nimi porozmawiać.
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_02"); //Wystarczy jednak, żebyś miał przeciw sobie więcej niż jednego z nich, a nie będziesz miał szans! Więc lepiej się zachowuj!
	
	B_LogEntry (Topic_Lehrling,"Aby zyskać poparcie pozostałych mistrzów, muszę dowieść swojej wartości.");
};	

// ************************************************************
// 			  				WarumNichtBeiDir 			E5
// ************************************************************
INSTANCE DIA_Matteo_WarumNichtBeiDir (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_WarumNichtBeiDir_Condition;
	information	= DIA_MAtteo_WarumNichtBeiDir_Info;
	permanent	= FALSE;
	description = "A dlaczego TY mnie nie weźmiesz na czeladnika?";
};                       
FUNC INT DIA_Matteo_WarumNichtBeiDir_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WarumNichtBeiDir_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WarumNichtBeiDir_15_00"); //A dlaczego TY mnie nie weźmiesz na czeladnika?
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_01"); //Ja nie mam nic przeciwko, ale inni mistrzowie nie zgadzają się.
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_02"); //Ostatnio przyjąłem innego czeladnika.
};	

// ************************************************************
// 			  				Andere Möglichkeie 			E5
// ************************************************************
INSTANCE DIA_Matteo_OtherWay (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_OtherWay_Condition;
	information	= DIA_MAtteo_OtherWay_Info;
	permanent	= FALSE;
	description = "Czy jest jakiś inny sposób, żeby dostać się do górnego miasta?";
};                       
FUNC INT DIA_Matteo_OtherWay_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_OtherWay_Info()
{	
	AI_Output (other, self, "DIA_Matteo_OtherWay_15_00"); //Czy jest jakiś inny sposób, żeby dostać się do górnego miasta?
	AI_Output (self, other, "DIA_Matteo_OtherWay_09_01"); //Może... dam ci znać, jak coś wymyślę.
};	

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Matteo_Minenanteil (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_Minenanteil_Condition;
	information	= DIA_MAtteo_Minenanteil_Info;

	description = "Wśród rzeczy na sprzedaż zauważyłem udziały w kopalni.";
};   
                    
FUNC INT DIA_Matteo_Minenanteil_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Matteo_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Minenanteil_15_00"); //Wśród rzeczy na sprzedaż zauważyłem udziały w kopalni. Od kogo je masz?
	AI_Output (self, other, "DIA_Matteo_Minenanteil_09_01"); //Udziały w kopalni? Eeee. Skąd się wzięły? Nie mam pojęcia, skąd je mam. Naprawdę, Panie.
	B_GivePlayerXP (XP_Ambient);
};	





































