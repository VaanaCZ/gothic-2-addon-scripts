
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Kjorn_EXIT   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 999;
	condition   = DIA_Kjorn_EXIT_Condition;
	information = DIA_Kjorn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kjorn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_Kjorn_Hello   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 4;
	condition   = DIA_Kjorn_Hello_Condition;
	information = DIA_Kjorn_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;	
};

FUNC INT DIA_Kjorn_Hello_Condition()
{
	IF (Npc_GetDistToNpc (self,hero) < 300)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kjorn_Hello_Info()
{
	AI_Output	(self ,other,"DIA_Kjorn_Hello_06_00"); //Hej, podejd� tu!
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_01"); //Czego chcesz?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_02"); //Dolina jest niebezpiecznym miejscem, bez odpowiedniego ekwipunku nie dasz tam sobie rady.
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_03"); //Rozumiem, �e TY posiadasz w�a�ciwy ekwipunek?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_04"); //Zgad�e�. I wiesz co? Ch�tnie ci go sprzedam.
};

//*********************************************************************
//	Info TRADE 
//*********************************************************************
INSTANCE DIA_Kjorn_TRADE   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 4;
	condition   = DIA_Kjorn_TRADE_Condition;
	information = DIA_Kjorn_TRADE_Info;
	Trade		= TRUE;
	permanent   = TRUE;
	description	= "Co mo�esz mi zaoferowa�?";
				
};

FUNC INT DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_TRADE_Info()
{
	B_GiveTradeInv (self);
	AI_Output	(other,self ,"DIA_Kjorn_TRADE_15_00"); //Co mo�esz mi zaoferowa�?

};

//*********************************************************************
//	Verkaufst du auch Informationen? 
//*********************************************************************
INSTANCE DIA_Kjorn_SellInfos   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_SellInfos_Condition;
	information = DIA_Kjorn_SellInfos_Info;
	permanent   = FALSE;
	description	= "Czy sprzedajesz r�wnie� informacje?";
				
};

FUNC INT DIA_Kjorn_SellInfos_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_SellInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_SellInfos_15_00"); //Czy sprzedajesz r�wnie� informacje?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_01"); //To zale�y. Za odpowiedni� cen� powiem ci wszystko, co wiem.
	AI_Output 	(other,self ,"DIA_Kjorn_SellInfos_15_02"); //Ile chcesz za informacje?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_03"); //Hmmm... Sam nie wiem. 50 sztuk z�ota za ka�d� udzielon� ci informacj� wydaje mi si� rozs�dn� cen�.
};

//*********************************************************************
//	Ich brauche Infos �ber.. 
//*********************************************************************
INSTANCE DIA_Kjorn_BuyInfos   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_BuyInfos_Condition;
	information = DIA_Kjorn_BuyInfos_Info;
	permanent   = TRUE;
	description	= "Potrzebuj� paru informacji.";
				
};

FUNC INT DIA_Kjorn_BuyInfos_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Kjorn_SellInfos))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_BuyInfos_15_00"); //Potrzebuj� informacji.
	AI_Output 	(self ,other,"DIA_Kjorn_BuyInfos_06_01"); //50 sztuk z�ota!
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	Info_AddChoice (DIA_Kjorn_BuyInfos,"To troch� za drogo.",DIA_Kjorn_BuyInfos_HoldMoney);	
	
	IF (Npc_HasItems (other,ItMi_Gold) >=50)
	{	
		Info_AddChoice (DIA_Kjorn_BuyInfos,"Tak, prosz�.",DIA_Kjorn_BuyInfos_GiveMoney);
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_HoldMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_HoldMoney_15_00"); //To dla mnie za drogo.
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_GiveMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_00"); //Prosz�.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_01"); //A teraz powiedz mi...
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	
	//----- Zur�ck -----
	
	Info_AddChoice (DIA_Kjorn_BuyInfos,DIALOG_BACK,DIA_Kjorn_BuyInfos_Back);
	
	//----- Die Drachen -----
	
	if KjornToldDragon == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o smokach.",DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if KjornToldDragon == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o smokach - dok�adniej.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	
	//----- Das Minental -----
	
	if KjornToldColony == 0
	{	
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o G�rniczej Dolinie.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if KjornToldColony == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o G�rniczej Dolinie - dok�adniej.",DIA_Kjorn_BuyInfos_Colony2);
	};
	
	//----- die Burg -----
	
	if KJornToldOldCamp == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o zamku.",DIA_Kjorn_BuyInfos_OldCamp1);
	};
	
	//----- Die Orks -----
	
	if KjornToldOrks == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o orkach.",DIA_Kjorn_BuyInfos_Orks1);
	}
	else if KjornToldOrks == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o orkach - dok�adniej.",DIA_Kjorn_BuyInfos_Orks2);
	};	
	
};

//------ Zur�ck -----

FUNC VOID DIA_Kjorn_BuyInfos_Back ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Back_15_00"); //Wiesz co, zwr�� mi moje pieni�dze, rozmy�li�em si�.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Back_06_01"); //Prosz� bardzo.
	
	B_GiveInvItems (self,other,ItMi_Gold,50);
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Drachen -----

FUNC VOID DIA_Kjorn_BuyInfos_Dragon1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon1_15_00"); //Opowiedz mi o smokach.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01"); //Smoki to pradawne, niewyobra�alnie pot�ne istoty. Kiedy� tysi�ce tych stworze� zamieszkiwa�o ca�y �wiat.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02"); //Jednak up�yn�o ju� ponad sto lat, odk�d widziano ostatniego smoka.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03"); //Ich krew jest gor�ca niczym wrz�cy olej. Je�li spojrzysz im prosto w oczy, twoje serce obr�ci si� w kamie�. Tak s�ysza�em...
	
	KjornToldDragon = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Dragon2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon2_15_00"); //Opowiedz mi wi�cej o smokach.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01"); //Smoki r�ni� si� mi�dzy sob�.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02"); //Niekt�re z nich mog�yby pokry� ca�y �wiat warstw� lodu grub� na kilka st�p.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03"); //Inne lubi� mieszka� na bagnach lub w wulkanach.
	
	B_LogEntry (TOPIC_DRACHENJAGD,"�owca smok�w Kjorn uwa�a, �e istniej� r�ne rodzaje smok�w. Niekt�re z nich lubi� zimne, wilgotne miejsca, inne wol� ogie�."); 

	KjornToldDragon = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Das Minental -----

FUNC VOID DIA_Kjorn_BuyInfos_Colony1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony1_15_00"); //Opowiedz mi o G�rniczej Dolinie.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_01"); //G�rnicza Dolina Khorinis s�ynie w ca�ym kraju ze swojej magicznej rudy.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_02"); //Mo�na j� znale�� tylko w tych g�rach.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_03"); //Bro� wykuta z takiej rudy jest praktycznie niezniszczalna. Mo�na ni� przeci�� nawet najtwardszy pancerz.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_04"); //Jeszcze par� tygodni temu ca�� Dolin� otacza�a magiczna Bariera. Kto raz j� przekroczy�, zostawa� tam na ca�e �ycie.

	KjornToldColony = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Colony2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony2_15_00"); //Opowiedz mi wi�cej o G�rniczej Dolinie.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_01"); //W ci�gu paru ostatnich dni Dolina bardzo si� zmieni�a.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_02"); //Przybyli do niej orkowie, a wraz z nimi wszelkie mo�liwe potwory, jakie tylko mo�na sobie wyobrazi�.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_03"); //Podobno w okolicy przebywaj� jacy� my�liwi, jednak nie wiadomo nawet, czy jeszcze �yj�.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_04"); //Wygl�da to tak, jakby wszystkie stworzenia Beliara przyby�y do tej jednej Doliny.
	
	KjornToldColony = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Burg -----

FUNC VOID DIA_Kjorn_BuyInfos_OldCamp1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_OldCamp1_15_00"); //Opowiedz mi o zamku.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01"); //Znajduje si� praktycznie w samym �rodku G�rniczej Doliny.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02"); //Kiedy jeszcze dolina by�a wykorzystywana jako wi�zienie, lokalni baronowie kontrolowali st�d handel rud�.
	
	KjornToldOldCamp = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Die Orks -----

FUNC VOID DIA_Kjorn_BuyInfos_Orks1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks1_15_00"); //Opowiedz mi o orkach.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_01"); //Orkowie pojawili si� tutaj dopiero niedawno. Przynajmniej ci sprzed zamku.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_02"); //Dziwi mnie, jak dobrze s� zorganizowani. Orkowie przewa�nie atakuj� na o�lep, niezale�nie od okoliczno�ci.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_03"); //Ci orkowie najwyra�niej pr�buj� zyska� na czasie. Czekaj� na co�, nie wiemy tylko na co.
	
	KjornToldOrks = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Orks2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks2_15_00"); //Opowiedz mi wi�cej o orkach.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_01"); //Orkami dowodz� elitarni wojownicy. S� oni niezwykle silni i nosz� bardzo mocne zbroje. Praktycznie nie mo�na ich pokona�.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_02"); //Kiedy� widzia�em, jak jeden z nich powali� ogromny d�b zaledwie jednym ciosem swojego topora.
	
	KjornToldOrks = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Kjorn_AllDragonsDead   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_AllDragonsDead_Condition;
	information = DIA_Kjorn_AllDragonsDead_Info;
	permanent   = FALSE;
	description	= "Zabi�em wszystkie smoki!";
				
};

FUNC INT DIA_Kjorn_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kjorn_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_AllDragonsDead_15_00"); //Zabi�em wszystkie smoki!
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_01"); //Tak, pewnie. A ja zosta�em paladynem.
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_02"); //Mog�e� zabi� JEDNEGO, ale WSZYSTKIE? Ciekawe kto ci w to uwierzy.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kjorn_PICKPOCKET (C_INFO)
{
	npc			= DJG_710_Kjorn;
	nr			= 900;
	condition	= DIA_Kjorn_PICKPOCKET_Condition;
	information	= DIA_Kjorn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Kjorn_PICKPOCKET_Condition()
{
	C_Beklauen (47, 75);
};
 
FUNC VOID DIA_Kjorn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kjorn_PICKPOCKET);
	Info_AddChoice		(DIA_Kjorn_PICKPOCKET, DIALOG_BACK 		,DIA_Kjorn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kjorn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kjorn_PICKPOCKET_DoIt);
};

func void DIA_Kjorn_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kjorn_PICKPOCKET);
};
	
func void DIA_Kjorn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kjorn_PICKPOCKET);
};


