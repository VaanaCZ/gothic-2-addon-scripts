
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
	AI_Output	(self ,other,"DIA_Kjorn_Hello_06_00"); //Hej, podejdź tu!
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_01"); //Czego chcesz?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_02"); //Dolina jest niebezpiecznym miejscem, bez odpowiedniego ekwipunku nie dasz tam sobie rady.
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_03"); //Rozumiem, że TY posiadasz właściwy ekwipunek?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_04"); //Zgadłeś. I wiesz co? Chętnie ci go sprzedam.
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
	description	= "Co możesz mi zaoferować?";
				
};

FUNC INT DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_TRADE_Info()
{
	B_GiveTradeInv (self);
	AI_Output	(other,self ,"DIA_Kjorn_TRADE_15_00"); //Co możesz mi zaoferować?

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
	description	= "Czy sprzedajesz również informacje?";
				
};

FUNC INT DIA_Kjorn_SellInfos_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_SellInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_SellInfos_15_00"); //Czy sprzedajesz również informacje?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_01"); //To zależy. Za odpowiednią cenę powiem ci wszystko, co wiem.
	AI_Output 	(other,self ,"DIA_Kjorn_SellInfos_15_02"); //Ile chcesz za informacje?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_03"); //Hmmm... Sam nie wiem. 50 sztuk złota za każdą udzieloną ci informację wydaje mi się rozsądną ceną.
};

//*********************************************************************
//	Ich brauche Infos über.. 
//*********************************************************************
INSTANCE DIA_Kjorn_BuyInfos   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_BuyInfos_Condition;
	information = DIA_Kjorn_BuyInfos_Info;
	permanent   = TRUE;
	description	= "Potrzebuję paru informacji.";
				
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
	AI_Output	(other,self ,"DIA_Kjorn_BuyInfos_15_00"); //Potrzebuję informacji.
	AI_Output 	(self ,other,"DIA_Kjorn_BuyInfos_06_01"); //50 sztuk złota!
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	Info_AddChoice (DIA_Kjorn_BuyInfos,"To trochę za drogo.",DIA_Kjorn_BuyInfos_HoldMoney);	
	
	IF (Npc_HasItems (other,ItMi_Gold) >=50)
	{	
		Info_AddChoice (DIA_Kjorn_BuyInfos,"Tak, proszę.",DIA_Kjorn_BuyInfos_GiveMoney);
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_HoldMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_HoldMoney_15_00"); //To dla mnie za drogo.
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_GiveMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_00"); //Proszę.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_01"); //A teraz powiedz mi...
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	
	//----- Zurück -----
	
	Info_AddChoice (DIA_Kjorn_BuyInfos,DIALOG_BACK,DIA_Kjorn_BuyInfos_Back);
	
	//----- Die Drachen -----
	
	if KjornToldDragon == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o smokach.",DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if KjornToldDragon == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o smokach - dokładniej.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	
	//----- Das Minental -----
	
	if KjornToldColony == 0
	{	
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o Górniczej Dolinie.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if KjornToldColony == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o Górniczej Dolinie - dokładniej.",DIA_Kjorn_BuyInfos_Colony2);
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
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o orkach - dokładniej.",DIA_Kjorn_BuyInfos_Orks2);
	};	
	
};

//------ Zurück -----

FUNC VOID DIA_Kjorn_BuyInfos_Back ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Back_15_00"); //Wiesz co, zwróć mi moje pieniądze, rozmyśliłem się.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Back_06_01"); //Proszę bardzo.
	
	B_GiveInvItems (self,other,ItMi_Gold,50);
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Drachen -----

FUNC VOID DIA_Kjorn_BuyInfos_Dragon1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon1_15_00"); //Opowiedz mi o smokach.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01"); //Smoki to pradawne, niewyobrażalnie potężne istoty. Kiedyś tysiące tych stworzeń zamieszkiwało cały świat.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02"); //Jednak upłynęło już ponad sto lat, odkąd widziano ostatniego smoka.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03"); //Ich krew jest gorąca niczym wrzący olej. Jeśli spojrzysz im prosto w oczy, twoje serce obróci się w kamień. Tak słyszałem...
	
	KjornToldDragon = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Dragon2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon2_15_00"); //Opowiedz mi więcej o smokach.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01"); //Smoki różnią się między sobą.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02"); //Niektóre z nich mogłyby pokryć cały świat warstwą lodu grubą na kilka stóp.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03"); //Inne lubią mieszkać na bagnach lub w wulkanach.
	
	B_LogEntry (TOPIC_DRACHENJAGD,"Łowca smoków Kjorn uważa, że istnieją różne rodzaje smoków. Niektóre z nich lubią zimne, wilgotne miejsca, inne wolą ogień."); 

	KjornToldDragon = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Das Minental -----

FUNC VOID DIA_Kjorn_BuyInfos_Colony1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony1_15_00"); //Opowiedz mi o Górniczej Dolinie.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_01"); //Górnicza Dolina Khorinis słynie w całym kraju ze swojej magicznej rudy.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_02"); //Można ją znaleźć tylko w tych górach.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_03"); //Broń wykuta z takiej rudy jest praktycznie niezniszczalna. Można nią przeciąć nawet najtwardszy pancerz.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_04"); //Jeszcze parę tygodni temu całą Dolinę otaczała magiczna Bariera. Kto raz ją przekroczył, zostawał tam na całe życie.

	KjornToldColony = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Colony2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony2_15_00"); //Opowiedz mi więcej o Górniczej Dolinie.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_01"); //W ciągu paru ostatnich dni Dolina bardzo się zmieniła.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_02"); //Przybyli do niej orkowie, a wraz z nimi wszelkie możliwe potwory, jakie tylko można sobie wyobrazić.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_03"); //Podobno w okolicy przebywają jacyś myśliwi, jednak nie wiadomo nawet, czy jeszcze żyją.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_04"); //Wygląda to tak, jakby wszystkie stworzenia Beliara przybyły do tej jednej Doliny.
	
	KjornToldColony = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Burg -----

FUNC VOID DIA_Kjorn_BuyInfos_OldCamp1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_OldCamp1_15_00"); //Opowiedz mi o zamku.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01"); //Znajduje się praktycznie w samym środku Górniczej Doliny.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02"); //Kiedy jeszcze dolina była wykorzystywana jako więzienie, lokalni baronowie kontrolowali stąd handel rudą.
	
	KjornToldOldCamp = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Die Orks -----

FUNC VOID DIA_Kjorn_BuyInfos_Orks1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks1_15_00"); //Opowiedz mi o orkach.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_01"); //Orkowie pojawili się tutaj dopiero niedawno. Przynajmniej ci sprzed zamku.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_02"); //Dziwi mnie, jak dobrze są zorganizowani. Orkowie przeważnie atakują na oślep, niezależnie od okoliczności.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_03"); //Ci orkowie najwyraźniej próbują zyskać na czasie. Czekają na coś, nie wiemy tylko na co.
	
	KjornToldOrks = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Orks2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks2_15_00"); //Opowiedz mi więcej o orkach.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_01"); //Orkami dowodzą elitarni wojownicy. Są oni niezwykle silni i noszą bardzo mocne zbroje. Praktycznie nie można ich pokonać.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_02"); //Kiedyś widziałem, jak jeden z nich powalił ogromny dąb zaledwie jednym ciosem swojego topora.
	
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
	description	= "Zabiłem wszystkie smoki!";
				
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
	AI_Output	(other,self ,"DIA_Kjorn_AllDragonsDead_15_00"); //Zabiłem wszystkie smoki!
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_01"); //Tak, pewnie. A ja zostałem paladynem.
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_02"); //Mogłeś zabić JEDNEGO, ale WSZYSTKIE? Ciekawe kto ci w to uwierzy.
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


