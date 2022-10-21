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
	AI_Output (self ,other,"DIA_Hanna_Hello_17_00"); //Ach, klient - co mog� dla ciebie zrobi�?
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
	AI_Output (self ,other,"DIA_Hanna_Room_17_01"); //A wi�c trafi�e� we w�a�ciwe miejsce.
	if (Npc_KnowsInfo (other, DIA_Lothar_Schlafen))
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_03"); //Jeden z paladyn�w powiedzia� mi, �e mog� tu sp�dzi� noc za darmo...
	}
	else
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_00"); //Ile kosztuje nocleg?
		AI_Output (self, other, "DIA_Hanna_Add_17_01"); //Absolutnie nic.
		AI_Output (self, other, "DIA_Hanna_Add_17_02"); //Paladyni op�acaj� noclegi dla wszystkich przyjezdnych.
		AI_Output (other, self, "DIA_Hanna_Add_15_04"); //A wi�c mog� tutaj nocowa� za darmo?
	};
	
	AI_Output (self, other, "DIA_Hanna_Add_17_05"); //Tak.
	AI_Output (self, other, "DIA_Hanna_Add_17_06"); //Id� na g�r�.
	AI_Output (self, other, "DIA_Hanna_Add_17_07"); //Wci�� jeszcze mamy tu kilka wolnych ��ek.
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
	description	= "Czemu paladyni op�acaj� noclegi?";
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
	AI_Output (other, self, "DIA_Hanna_Add_15_12"); //Czemu paladyni op�acaj� noclegi?
	AI_Output (self, other, "DIA_Hanna_Add_17_13"); //Ja te� tego nie rozumiem.
	AI_Output (self, other, "DIA_Hanna_Add_17_14"); //Mo�e chodzi im o to, �eby oczy�ci� ulice z biedoty, kt�ra, jak wiadomo, pope�nia wiele przest�pstw.
	AI_Output (self, other, "DIA_Hanna_Add_17_15"); //Poza tym, pewnie chc� si� przypodoba� w�drownym kupcom.
	AI_Output (self, other, "DIA_Hanna_Add_17_16"); //Odk�d ch�opi zacz�li si� buntowa�, to oni s� naszym jedynym �r�d�em zaopatrzenia.
	AI_Output (self, other, "DIA_Hanna_Add_17_17"); //A poza tym, chyba chc� za�agodzi� panuj�ce w mie�cie nastroje.
	AI_Output (self, other, "DIA_Hanna_Add_17_18"); //Lord Andre zorganizowa� nawet darmowe piwo. Rozdaje je na placu wisielc�w.
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
	AI_Output (self, other, "DIA_Hanna_Add_17_09"); //Praktycznie wszyscy moi klienci to w�drowni handlarze.
	AI_Output (other, self, "DIA_Hanna_Add_15_10"); //Aha.
	AI_Output (self, other, "DIA_Hanna_Add_17_11"); //Tylko nie pr�buj ich okrada�! Nie chc� tutaj �adnych problem�w!
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
	description	= "Mam par� pyta� dotycz�cych miasta...";
};                       

FUNC INT DIA_Hanna_City_Condition()
{
		return TRUE;	
};
 
FUNC VOID DIA_Hanna_City_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_City_15_00"); //Mam par� pyta� dotycz�cych miasta...
	
	Info_ClearChoices (DIA_Hanna_City);
	Info_AddChoice (DIA_Hanna_City,DIALOG_BACK,DIA_Hanna_City_Back);
	Info_AddChoice (DIA_Hanna_City,"Gdzie mog� tu co� kupi�?",DIA_Hanna_City_Buy);
	Info_AddChoice (DIA_Hanna_City,"Opowiedz mi o mie�cie.",DIA_Hanna_City_City);
};

FUNC VOID DIA_Hanna_City_Back ()
{
	Info_ClearChoices (DIA_Hanna_City);
};

FUNC VOID DIA_Hanna_City_Buy ()
{
	AI_Output (other,self ,"DIA_Hanna_City_Buy_15_00"); //Gdzie mog� tu co� kupi�?
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_01"); //Targ znajduje si� dok�adnie naprzeciwko drzwi frontowych. Znajdziesz tam wszelkie mo�liwe towary.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_02"); //Po drugiej stronie miasta jest jeszcze kilka sklep�w i zak�ad�w rzemie�lniczych. Wi�kszo�� z nich znajduje si� przy bramie.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_03"); //Ryby mo�esz kupi� w dzielnicy portowej. Sklep rybny znajdziesz tam bez trudu.
};

FUNC VOID DIA_Hanna_City_City ()
{
	AI_Output (other,self ,"DIA_Hanna_City_City_15_00"); //Opowiedz mi o mie�cie.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_01"); //Khorinis to jedno z najbogatszych miast w kr�lestwie, cho� mo�e w tym momencie trudno w to uwierzy�.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_02"); //Odk�d zacz�a si� wojna z orkami, handel przesta� przynosi� zyski. Kr�l za��da�, �eby wszystkie statki handlowe zosta�y skonfiskowane na u�ytek armii.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_03"); //Wi�c rzadko przyp�ywaj� tutaj jakiekolwiek jednostki, co z kolei oznacza marne zaopatrzenie. Wielu mieszka�c�w martwi taki stan rzeczy.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_04"); //Nikt nie mo�e przewidzie�, co przyniesie przysz�o��. Mo�emy tylko z pokor� czeka� na to, co ma nast�pi�. Chyba nie mamy �adnego wp�ywu na przysz�e wydarzenia.
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
// 		Wie sieht�s aus?
// ************************************************************
INSTANCE DIA_Hanna_AnyNews(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_AnyNews_Condition;
	information	= DIA_Hanna_AnyNews_Info;
	permanent	= FALSE;
	description = "Co s�ycha�?";
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
	AI_Output (self ,other,"DIA_Hanna_AnyNews_17_01"); //Nie wygl�dasz na osob�, kt�ra przejmuje si� cudzymi zmartwieniami.
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Jasne, oczywi�cie.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice (DIA_Hanna_AnyNews,"To zale�y.",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice (DIA_Hanna_AnyNews,"Nie.",DIA_Hanna_AnyNews_No);
};

FUNC VOID DIA_Hanna_AnyNews_No ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_No_15_00"); //Niezupe�nie.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_No_17_01"); //No widzisz, o tym w�a�nie m�wi�. Ka�dy teraz my�li tylko o sobie. Czego chcesz?

	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Depends ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Depends_15_00"); //To zale�y.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_01"); //To zale�y, ile mo�na na tym zarobi�, to chcesz powiedzie�.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_02"); //Nie znosz� takich jak ty.


	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_15_00"); //Tak, pewnie. Nie ma problemu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_01"); //Wiesz, �ycie jest pe�ne niespodzianek. Ostatnio robi�am porz�dek w moich rzeczach i znalaz�am par� starych map, kt�re sprzeda�am kartografowi Brahimowi z portu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_02"); //Niestety, nied�ugo potem zauwa�y�am, �e brakuje mi pewnego dokumentu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_03"); //Przypuszczam, �e jakim� cudem dosta� si� pomi�dzy mapy.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_04"); //Czy m�g�by� go dla mnie odzyska�?
	
	MIS_HannaRetrieveLetter = LOG_RUNNING;

	Log_CreateTopic (TOPIC_HannaRetrieveLetter, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter, LOG_RUNNING);
	B_LogEntry (TOPIC_HannaRetrieveLetter,"Hanna zgubi�a pewien dokument. Najprawdopodobniej znajduje si� on w dzielnicy portowej, gdzie mie�ci si� siedziba kartografa Brahima."); 


	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Nie jestem ch�opcem na posy�ki.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice (DIA_Hanna_AnyNews,"A co JA b�d� z tego mia�?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice (DIA_Hanna_AnyNews,"Zobacz�, co da si� zrobi�.",DIA_Hanna_AnyNews_Yes_WillSee);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Footboy ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Footboy_15_00"); //Nie jestem ch�opcem na posy�ki.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01"); //Rozumiem - problemy prostej kobiety nic dla ciebie nie znacz�. Widz�, �e sama b�d� musia�a si� tym zaj��.

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_15_00"); //A co z tego b�d� mia�?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01"); //Aha, wiedzia�am. Niczym si� nie r�nisz od tej ho�oty mieszkaj�cej w porcie.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02"); //Wi�c czego chcesz ode mnie, biednej kobiety?
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Niewa�ne.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice (DIA_Hanna_AnyNews,"Mog�aby� by� dla mnie nieco milsza...",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice (DIA_Hanna_AnyNews,"Z�ota.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_OK ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00"); //Niewa�ne.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01"); //Widz�, �e jednak pozosta�a ci krztyna przyzwoito�ci. Je�li odzyskasz ten dokument, dostaniesz ode mnie 75 sztuk z�ota.

	Hanna_PriceForLetter = 75;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_BeNice ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00"); //Mog�aby� by� dla mnie nieco milsza...
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01"); //To oburzaj�ce. Wy...wyno� si� st�d! Ty wieprzu!
	
	MIS_HannaRetrieveLetter = LOG_FAILED;
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_Gold ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00"); //Z�ota.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01"); //Mog� ci za to da� 50 sztuk z�ota, nie wi�cej.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02"); //Je�li zdo�asz odzyska� dokument, dostaniesz ode mnie 50 sztuk z�ota.

	Hanna_PriceForLetter = 50;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};	

FUNC VOID DIA_Hanna_AnyNews_Yes_WillSee ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_WillSee_15_00"); //Zobacz�, co da si� zrobi�.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01"); //Jeste� taki s�odki. Powodzenia!
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02"); //Je�li przyniesiesz mi ten dokument, dostaniesz ode mnie nagrod�.
	
	Hanna_PriceForLetter = 200;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};


// ************************************************************
//		Meinst du dieses Schriftst�ck?
// ************************************************************
INSTANCE DIA_Hanna_ThisLetter(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_ThisLetter_Condition;
	information	= DIA_Hanna_ThisLetter_Info;
	permanent	= FALSE;
	description = "Czy chodzi�o o ten dokument?";
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
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_00"); //Czy chodzi�o o ten dokument?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_01"); //Tak, w�a�nie o ten. Dzi�kuj� ci.
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_02"); //Gdzie moja nagroda?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_03"); //Nie tak szybko. Oto twoje pieni�dze.
		
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
		AI_Output (self, other, "DIA_Hanna_Add_17_27"); //Sk�d... wracasz?
		AI_Output (other, self, "DIA_Hanna_Add_15_28"); //Znalaz�em ciekaw� rzecz w twojej piwnicy...
		AI_Output (self, other, "DIA_Hanna_Add_17_29"); //Co robi�e� w mojej piwnicy?!
		AI_Output (other, self, "DIA_Hanna_Add_15_30"); //Dobrze wiesz!
		AI_Output (self, other, "DIA_Hanna_Add_17_31"); //Nie mam poj�cia, o czym m�wisz...
	}
	else 
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_19"); //Sp�jrz tylko na siebie! Gdzie by�e�? Hm?
		AI_Output (other, self, "DIA_Hanna_Add_15_20"); //Ja...
		AI_Output (self, other, "DIA_Hanna_Add_17_21"); //Ju� wiem!
		AI_Output (self, other, "DIA_Hanna_Add_17_22"); //Nie musisz nic m�wi�. Domy�li�am si� wszystkiego.
		AI_Output (self, other, "DIA_Hanna_Add_17_23"); //Nawet nie my�l o tym, �eby co� st�d ukra��, jasne?
		AI_Output (self, other, "DIA_Hanna_Add_17_24"); //Nie mo�emy sobie pozwoli� na �aden skandal.
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
	description	= "Zobacz, jak� ksi��k� znalaz�em!";
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
	AI_Output (other, self, "DIA_Hanna_Add_15_41"); //Zobacz, jak� ksi��k� znalaz�em!
	AI_Output (self, other, "DIA_Hanna_Add_17_42"); //To ksi�ga rachunkowa Lehmara. Sk�d j� masz?
	AI_Output (other, self, "DIA_Hanna_Add_15_43"); //No...
	AI_Output (self, other, "DIA_Hanna_Add_17_44"); //To dobrze, �e Lehmar ju� jej nie ma. Jednak czu�abym si� lepiej, gdybym mog�a j� zatrzyma�.
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
	description = "Prosz� - we� t� ksi�g�.";
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
	AI_Output (other, self, "DIA_Hanna_Add_15_45"); //Prosz� - we� t� ksi�g�.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self, other, "DIA_Hanna_Add_17_46"); //Dzi�kuj�.
	AI_Output (self, other, "DIA_Hanna_Add_17_47"); //Przyjmij to w nagrod�.
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
	AI_Output (other, self, "DIA_Hanna_Add_15_37"); //Wszystko w porz�dku w kryj�wce?
	AI_Output (self, other, "DIA_Hanna_Add_17_39"); //Nie by�am tam ju� od d�u�szego czasu.
	AI_Output (self, other, "DIA_Hanna_Add_17_40"); //Kiedy tylko nadarzy si� okazja, zejd� na d� i sprawdz�, czy wszystko w porz�dku.
	AI_Output (self, other, "DIA_Hanna_Add_17_38"); //Tak. Ale lepiej o tym tak g�o�no nie m�wi�.
	//-------------------
	AI_Output (other, self, "DIA_Hanna_Add_15_25"); //Wiedzia�a� o z�odziejskiej kryj�wce?
	AI_Output (self, other, "DIA_Hanna_Add_17_26"); //Nie mam poj�cia, o czym m�wisz...
	//-------------------
	AI_Output (self, other, "DIA_Hanna_Add_17_32"); //By�a tutaj stra�... Kto� powiedzia� im o kryj�wce!
	AI_Output (self, other, "DIA_Hanna_Add_17_33"); //Nie mogli mi nic udowodni�, ale Cassia i jej ludzie nie �yj�!
	AI_Output (self, other, "DIA_Hanna_Add_17_34"); //Jestem pewna, �e to TWOJA sprawka...
	AI_Output (self, other, "DIA_Hanna_Add_17_35"); //Kupi�am to specjalnie dla ciebie.
	AI_Output (self, other, "DIA_Hanna_Add_17_36"); //Kosztowa�o mnie to mas� pieni�dzy, ale op�aca�o si�, ty �winio...
};	

	
