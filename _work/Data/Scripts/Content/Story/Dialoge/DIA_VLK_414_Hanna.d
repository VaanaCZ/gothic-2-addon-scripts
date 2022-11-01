// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Hanna_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_EXIT_Condition;
	information	= DIA_Hanna_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hanna_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hanna_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Hanna_Hello(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Hello_Condition;
	information	= DIA_Hanna_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Hanna_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Hanna_Hello_17_00"); //Ach, klient - co mogę dla ciebie zrobić?
};	

//*****************************************
//	Ich suche ein Zimmer
//*****************************************
INSTANCE DIA_Hanna_Room(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 2;
	condition	= DIA_Hanna_Room_Condition;
	information	= DIA_Hanna_Room_Info;
	permanent	= FALSE;
	description	= "Szukam pokoju.";
};                       

FUNC INT DIA_Hanna_Room_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Room_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_Room_15_00"); //Szukam pokoju.
	AI_Output (self ,other,"DIA_Hanna_Room_17_01"); //A więc trafiłeś we właściwe miejsce.
	if (Npc_KnowsInfo (other, DIA_Lothar_Schlafen))
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_03"); //Jeden z paladynów powiedział mi, że mogę tu spędzić noc za darmo...
	}
	else
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_00"); //Ile kosztuje nocleg?
		AI_Output (self, other, "DIA_Hanna_Add_17_01"); //Absolutnie nic.
		AI_Output (self, other, "DIA_Hanna_Add_17_02"); //Paladyni opłacają noclegi dla wszystkich przyjezdnych.
		AI_Output (other, self, "DIA_Hanna_Add_15_04"); //A więc mogę tutaj nocować za darmo?
	};
	
	AI_Output (self, other, "DIA_Hanna_Add_17_05"); //Tak.
	AI_Output (self, other, "DIA_Hanna_Add_17_06"); //Idź na górę.
	AI_Output (self, other, "DIA_Hanna_Add_17_07"); //Wciąż jeszcze mamy tu kilka wolnych łóżek.
	//AI_Output (self ,other,"DIA_Hanna_Room_17_02"); //Geh einfach nach oben und suche dir ein Bett.
};

//*****************************************
//	WhyPay
//*****************************************
INSTANCE DIA_Hanna_WhyPay(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 3;
	condition	= DIA_Hanna_WhyPay_Condition;
	information	= DIA_Hanna_WhyPay_Info;
	permanent	= FALSE;
	description	= "Czemu paladyni opłacają noclegi?";
};                       

FUNC INT DIA_Hanna_WhyPay_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WhyPay_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_12"); //Czemu paladyni opłacają noclegi?
	AI_Output (self, other, "DIA_Hanna_Add_17_13"); //Ja też tego nie rozumiem.
	AI_Output (self, other, "DIA_Hanna_Add_17_14"); //Może chodzi im o to, żeby oczyścić ulice z biedoty, która, jak wiadomo, popełnia wiele przestępstw.
	AI_Output (self, other, "DIA_Hanna_Add_17_15"); //Poza tym, pewnie chcą się przypodobać wędrownym kupcom.
	AI_Output (self, other, "DIA_Hanna_Add_17_16"); //Odkąd chłopi zaczęli się buntować, to oni są naszym jedynym źródłem zaopatrzenia.
	AI_Output (self, other, "DIA_Hanna_Add_17_17"); //A poza tym, chyba chcą załagodzić panujące w mieście nastroje.
	AI_Output (self, other, "DIA_Hanna_Add_17_18"); //Lord Andre zorganizował nawet darmowe piwo. Rozdaje je na placu wisielców.
};

//*****************************************
//	WerHier - PERM
//*****************************************
INSTANCE DIA_Hanna_WerHier(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 4;
	condition	= DIA_Hanna_WerHier_Condition;
	information	= DIA_Hanna_WerHier_Info;
	permanent	= TRUE;
	description	= "Kto tu teraz mieszka?";
};                       

FUNC INT DIA_Hanna_WerHier_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WerHier_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_08"); //Kto tu teraz mieszka?
	AI_Output (self, other, "DIA_Hanna_Add_17_09"); //Praktycznie wszyscy moi klienci to wędrowni handlarze.
	AI_Output (other, self, "DIA_Hanna_Add_15_10"); //Aha.
	AI_Output (self, other, "DIA_Hanna_Add_17_11"); //Tylko nie próbuj ich okradać! Nie chcę tutaj żadnych problemów!
};

//**********************************************
//	Ich hab noch ein paar Fragen zur Stadt
//**********************************************

INSTANCE DIA_Hanna_City(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 5;
	condition	= DIA_Hanna_City_Condition;
	information	= DIA_Hanna_City_Info;
	permanent	= TRUE;
	description	= "Mam parę pytań dotyczących miasta...";
};                       

FUNC INT DIA_Hanna_City_Condition()
{
		return TRUE;	
};
 
FUNC VOID DIA_Hanna_City_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_City_15_00"); //Mam parę pytań dotyczących miasta...
	
	Info_ClearChoices (DIA_Hanna_City);
	Info_AddChoice (DIA_Hanna_City,DIALOG_BACK,DIA_Hanna_City_Back);
	Info_AddChoice (DIA_Hanna_City,"Gdzie mogę tu coś kupić?",DIA_Hanna_City_Buy);
	Info_AddChoice (DIA_Hanna_City,"Opowiedz mi o mieście.",DIA_Hanna_City_City);
};

FUNC VOID DIA_Hanna_City_Back ()
{
	Info_ClearChoices (DIA_Hanna_City);
};

FUNC VOID DIA_Hanna_City_Buy ()
{
	AI_Output (other,self ,"DIA_Hanna_City_Buy_15_00"); //Gdzie mogę tu coś kupić?
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_01"); //Targ znajduje się dokładnie naprzeciwko drzwi frontowych. Znajdziesz tam wszelkie możliwe towary.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_02"); //Po drugiej stronie miasta jest jeszcze kilka sklepów i zakładów rzemieślniczych. Większość z nich znajduje się przy bramie.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_03"); //Ryby możesz kupić w dzielnicy portowej. Sklep rybny znajdziesz tam bez trudu.
};

FUNC VOID DIA_Hanna_City_City ()
{
	AI_Output (other,self ,"DIA_Hanna_City_City_15_00"); //Opowiedz mi o mieście.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_01"); //Khorinis to jedno z najbogatszych miast w królestwie, choć może w tym momencie trudno w to uwierzyć.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_02"); //Odkąd zaczęła się wojna z orkami, handel przestał przynosić zyski. Król zażądał, żeby wszystkie statki handlowe zostały skonfiskowane na użytek armii.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_03"); //Więc rzadko przypływają tutaj jakiekolwiek jednostki, co z kolei oznacza marne zaopatrzenie. Wielu mieszkańców martwi taki stan rzeczy.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_04"); //Nikt nie może przewidzieć, co przyniesie przyszłość. Możemy tylko z pokorą czekać na to, co ma nastąpić. Chyba nie mamy żadnego wpływu na przyszłe wydarzenia.
};



//##################################
//##
//##	Kapitel 3
//##
//##################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hanna_Kap3_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_Kap3_EXIT_Condition;
	information	= DIA_Hanna_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hanna_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

var int Hanna_PriceForLetter;

// ************************************************************
// 		Wie sieht´s aus?
// ************************************************************
INSTANCE DIA_Hanna_AnyNews(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_AnyNews_Condition;
	information	= DIA_Hanna_AnyNews_Info;
	permanent	= FALSE;
	description = "Co słychać?";
};                       
FUNC INT DIA_Hanna_AnyNews_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_AnyNews_15_00"); //Jak ci idzie?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_17_01"); //Nie wyglądasz na osobę, która przejmuje się cudzymi zmartwieniami.
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Jasne, oczywiście.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice (DIA_Hanna_AnyNews,"To zależy.",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice (DIA_Hanna_AnyNews,"Nie.",DIA_Hanna_AnyNews_No);
};

FUNC VOID DIA_Hanna_AnyNews_No ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_No_15_00"); //Niezupełnie.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_No_17_01"); //No widzisz, o tym właśnie mówię. Każdy teraz myśli tylko o sobie. Czego chcesz?

	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Depends ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Depends_15_00"); //To zależy.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_01"); //To zależy, ile można na tym zarobić, to chcesz powiedzieć.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_02"); //Nie znoszę takich jak ty.


	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_15_00"); //Tak, pewnie. Nie ma problemu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_01"); //Wiesz, życie jest pełne niespodzianek. Ostatnio robiłam porządek w moich rzeczach i znalazłam parę starych map, które sprzedałam kartografowi Brahimowi z portu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_02"); //Niestety, niedługo potem zauważyłam, że brakuje mi pewnego dokumentu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_03"); //Przypuszczam, że jakimś cudem dostał się pomiędzy mapy.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_04"); //Czy mógłbyś go dla mnie odzyskać?
	
	MIS_HannaRetrieveLetter = LOG_RUNNING;

	Log_CreateTopic (TOPIC_HannaRetrieveLetter, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter, LOG_RUNNING);
	B_LogEntry (TOPIC_HannaRetrieveLetter,"Hanna zgubiła pewien dokument. Najprawdopodobniej znajduje się on w dzielnicy portowej, gdzie mieści się siedziba kartografa Brahima."); 


	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Nie jestem chłopcem na posyłki.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice (DIA_Hanna_AnyNews,"A co JA będę z tego miał?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice (DIA_Hanna_AnyNews,"Zobaczę, co da się zrobić.",DIA_Hanna_AnyNews_Yes_WillSee);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Footboy ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Footboy_15_00"); //Nie jestem chłopcem na posyłki.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01"); //Rozumiem - problemy prostej kobiety nic dla ciebie nie znaczą. Widzę, że sama będę musiała się tym zająć.

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_15_00"); //A co z tego będę miał?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01"); //Aha, wiedziałam. Niczym się nie różnisz od tej hołoty mieszkającej w porcie.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02"); //Więc czego chcesz ode mnie, biednej kobiety?
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Nieważne.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice (DIA_Hanna_AnyNews,"Mogłabyś być dla mnie nieco milsza...",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice (DIA_Hanna_AnyNews,"Złota.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_OK ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00"); //Nieważne.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01"); //Widzę, że jednak pozostała ci krztyna przyzwoitości. Jeśli odzyskasz ten dokument, dostaniesz ode mnie 75 sztuk złota.

	Hanna_PriceForLetter = 75;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_BeNice ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00"); //Mogłabyś być dla mnie nieco milsza...
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01"); //To oburzające. Wy...wynoś się stąd! Ty wieprzu!
	
	MIS_HannaRetrieveLetter = LOG_FAILED;
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_Gold ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00"); //Złota.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01"); //Mogę ci za to dać 50 sztuk złota, nie więcej.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02"); //Jeśli zdołasz odzyskać dokument, dostaniesz ode mnie 50 sztuk złota.

	Hanna_PriceForLetter = 50;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};	

FUNC VOID DIA_Hanna_AnyNews_Yes_WillSee ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_WillSee_15_00"); //Zobaczę, co da się zrobić.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01"); //Jesteś taki słodki. Powodzenia!
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02"); //Jeśli przyniesiesz mi ten dokument, dostaniesz ode mnie nagrodę.
	
	Hanna_PriceForLetter = 200;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};


// ************************************************************
//		Meinst du dieses Schriftstück?
// ************************************************************
INSTANCE DIA_Hanna_ThisLetter(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_ThisLetter_Condition;
	information	= DIA_Hanna_ThisLetter_Info;
	permanent	= FALSE;
	description = "Czy chodziło o ten dokument?";
};                       
FUNC INT DIA_Hanna_ThisLetter_Condition()
{
	if (MIS_HannaRetrieveLetter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_ShatteredGolem_Mis) >= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_ThisLetter_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_00"); //Czy chodziło o ten dokument?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_01"); //Tak, właśnie o ten. Dziękuję ci.
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_02"); //Gdzie moja nagroda?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_03"); //Nie tak szybko. Oto twoje pieniądze.
		
	CreateInvItems (self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems (self,other,ItMi_Gold,Hanna_PriceForLetter);
	
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP (XP_HannaRetrieveLetter);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hanna_PICKPOCKET (C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 900;
	condition	= DIA_Hanna_PICKPOCKET_Condition;
	information	= DIA_Hanna_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Hanna_PICKPOCKET_Condition()
{
	C_Beklauen (45, 25);
};
 
FUNC VOID DIA_Hanna_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hanna_PICKPOCKET);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_BACK 		,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};
	
func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};


// ************************************************************
//						Aus Keller
// ************************************************************

INSTANCE DIA_Hanna_AusKeller(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 11;
	condition	= DIA_Hanna_AusKeller_Condition;
	information	= DIA_Hanna_AusKeller_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Hanna_AusKeller_Condition()
{
	if (Npc_HasItems (other, ItKe_ThiefGuildKey_Hotel_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_AusKeller_Info()
{	
	if (Cassia.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Jesper.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Ramirez.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_27"); //Skąd... wracasz?
		AI_Output (other, self, "DIA_Hanna_Add_15_28"); //Znalazłem ciekawą rzecz w twojej piwnicy...
		AI_Output (self, other, "DIA_Hanna_Add_17_29"); //Co robiłeś w mojej piwnicy?!
		AI_Output (other, self, "DIA_Hanna_Add_15_30"); //Dobrze wiesz!
		AI_Output (self, other, "DIA_Hanna_Add_17_31"); //Nie mam pojęcia, o czym mówisz...
	}
	else 
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_19"); //Spójrz tylko na siebie! Gdzie byłeś? Hm?
		AI_Output (other, self, "DIA_Hanna_Add_15_20"); //Ja...
		AI_Output (self, other, "DIA_Hanna_Add_17_21"); //Już wiem!
		AI_Output (self, other, "DIA_Hanna_Add_17_22"); //Nie musisz nic mówić. Domyśliłam się wszystkiego.
		AI_Output (self, other, "DIA_Hanna_Add_17_23"); //Nawet nie myśl o tym, żeby coś stąd ukraść, jasne?
		AI_Output (self, other, "DIA_Hanna_Add_17_24"); //Nie możemy sobie pozwolić na żaden skandal.
	};	
	
	AI_StopProcessInfos (self);
};

// ************************************************************
//						Schuldenbuch zeigen
// ************************************************************

INSTANCE DIA_Hanna_Schuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Schuldenbuch_Condition;
	information	= DIA_Hanna_Schuldenbuch_Info;
	permanent	= FALSE;
	description	= "Zobacz, jaką książkę znalazłem!";
};                       
FUNC INT DIA_Hanna_Schuldenbuch_Condition()
{
	if (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_Schuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_41"); //Zobacz, jaką książkę znalazłem!
	AI_Output (self, other, "DIA_Hanna_Add_17_42"); //To księga rachunkowa Lehmara. Skąd ją masz?
	AI_Output (other, self, "DIA_Hanna_Add_15_43"); //No...
	AI_Output (self, other, "DIA_Hanna_Add_17_44"); //To dobrze, że Lehmar już jej nie ma. Jednak czułabym się lepiej, gdybym mogła ją zatrzymać.
};

// ************************************************************
//						Schuldenbuch geben
// ************************************************************
instance DIA_Hanna_GiveSchuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_GiveSchuldenbuch_Condition;
	information	= DIA_Hanna_GiveSchuldenbuch_Info;
	permanent	= FALSE;
	description = "Proszę - weź tę księgę.";
};                       
FUNC INT DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Schuldenbuch))
	&& (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_GiveSchuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_45"); //Proszę - weź tę księgę.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self, other, "DIA_Hanna_Add_17_46"); //Dziękuję.
	AI_Output (self, other, "DIA_Hanna_Add_17_47"); //Przyjmij to w nagrodę.
	B_GiveInvItems (self, other, ItSe_HannasBeutel, 1);
	B_GivePlayerXP (XP_Schuldenbuch);
	AI_Output (other, self, "DIA_Hanna_Add_15_49"); //Co to jest?
	AI_Output (self, other, "DIA_Hanna_Add_17_48"); //To klucz do bram bogactwa.
};


// ************************************************************
// 			  				
// ************************************************************
func void Hanna_Blubb()
{
	AI_Output (other, self, "DIA_Hanna_Add_15_37"); //Wszystko w porządku w kryjówce?
	AI_Output (self, other, "DIA_Hanna_Add_17_39"); //Nie byłam tam już od dłuższego czasu.
	AI_Output (self, other, "DIA_Hanna_Add_17_40"); //Kiedy tylko nadarzy się okazja, zejdę na dół i sprawdzę, czy wszystko w porządku.
	AI_Output (self, other, "DIA_Hanna_Add_17_38"); //Tak. Ale lepiej o tym tak głośno nie mówić.
	//-------------------
	AI_Output (other, self, "DIA_Hanna_Add_15_25"); //Wiedziałaś o złodziejskiej kryjówce?
	AI_Output (self, other, "DIA_Hanna_Add_17_26"); //Nie mam pojęcia, o czym mówisz...
	//-------------------
	AI_Output (self, other, "DIA_Hanna_Add_17_32"); //Była tutaj straż... Ktoś powiedział im o kryjówce!
	AI_Output (self, other, "DIA_Hanna_Add_17_33"); //Nie mogli mi nic udowodnić, ale Cassia i jej ludzie nie żyją!
	AI_Output (self, other, "DIA_Hanna_Add_17_34"); //Jestem pewna, że to TWOJA sprawka...
	AI_Output (self, other, "DIA_Hanna_Add_17_35"); //Kupiłam to specjalnie dla ciebie.
	AI_Output (self, other, "DIA_Hanna_Add_17_36"); //Kosztowało mnie to masę pieniędzy, ale opłacało się, ty świnio...
};	

	
