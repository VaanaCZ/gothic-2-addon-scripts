
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
	AI_Output	(self ,other,"DIA_Kjorn_Hello_06_00"); //Hej, pojï sem!
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_01"); //Co chceš?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_02"); //Tohle údolí je nebezpeèné místo a bez poøádného vybavení budeš mrtvej, ani se nenadìješ.
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_03"); //Pøedpokládám, e to poøádné vybavení najdu u TEBE.
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_04"); //To se vsaï. Dokonce ti ho mùu prodat.
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
	description	= "Co mi mùeš nabídnout?";
				
};

FUNC INT DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_TRADE_Info()
{
	B_GiveTradeInv (self);
	AI_Output	(other,self ,"DIA_Kjorn_TRADE_15_00"); //Co mi mùeš nabídnout?

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
	description	= "Prodáváš taky informace?";
				
};

FUNC INT DIA_Kjorn_SellInfos_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_SellInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_SellInfos_15_00"); //Prodáváš taky informace?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_01"); //Pøijde na to. Pokud je dobrá cena, øeknu všechno, co vím.
	AI_Output 	(other,self ,"DIA_Kjorn_SellInfos_15_02"); //Kolik?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_03"); //Hmm... tìko øíct. Ale myslím, e 50 zlatıch za kadou poskytnutou informaci je docela dobrá cena.
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
	description	= "Potøebuju nìjaké informace.";
				
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
	AI_Output	(other,self ,"DIA_Kjorn_BuyInfos_15_00"); //Potøebuju nìjaké informace.
	AI_Output 	(self ,other,"DIA_Kjorn_BuyInfos_06_01"); //50 zlatıch!
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	Info_AddChoice (DIA_Kjorn_BuyInfos,"To je pro mì moc drahé.",DIA_Kjorn_BuyInfos_HoldMoney);	
	
	IF (Npc_HasItems (other,ItMi_Gold) >=50)
	{	
		Info_AddChoice (DIA_Kjorn_BuyInfos,"Ano, tady.",DIA_Kjorn_BuyInfos_GiveMoney);
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_HoldMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_HoldMoney_15_00"); //To je pro mì moc drahé.
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_GiveMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_00"); //Ano, tady.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_01"); //A teï mi øekni...
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	
	//----- Zurück -----
	
	Info_AddChoice (DIA_Kjorn_BuyInfos,DIALOG_BACK,DIA_Kjorn_BuyInfos_Back);
	
	//----- Die Drachen -----
	
	if KjornToldDragon == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o dracích.",DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if KjornToldDragon == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...ještì nìco o dracích.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	
	//----- Das Minental -----
	
	if KjornToldColony == 0
	{	
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o Hornickém údolí.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if KjornToldColony == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...ještì nìco o Hornickém údolí.",DIA_Kjorn_BuyInfos_Colony2);
	};
	
	//----- die Burg -----
	
	if KJornToldOldCamp == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o hradu.",DIA_Kjorn_BuyInfos_OldCamp1);
	};
	
	//----- Die Orks -----
	
	if KjornToldOrks == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o skøetech.",DIA_Kjorn_BuyInfos_Orks1);
	}
	else if KjornToldOrks == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...ještì nìco o skøetech.",DIA_Kjorn_BuyInfos_Orks2);
	};	
	
};

//------ Zurück -----

FUNC VOID DIA_Kjorn_BuyInfos_Back ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Back_15_00"); //Víš, rozmyslel jsem si to. Vra mi moje peníze.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Back_06_01"); //Jak je libo.
	
	B_GiveInvItems (self,other,ItMi_Gold,50);
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Drachen -----

FUNC VOID DIA_Kjorn_BuyInfos_Dragon1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon1_15_00"); //Øekni mi nìco o dracích.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01"); //Draci jsou pradávná, neuvìøitelnì mocná stvoøení. Kdysi jich ily tisíce po celém svìtì.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02"); //Ale u je to pøes sto let, co nìkterého z nich nìkdo vidìl.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03"); //Jejich krev je horká jako vroucí olej. Kdy se ti podívají do oèí, promìní se tvé srdce v kámen. Tak jsem to alespoò slyšel.
	
	KjornToldDragon = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Dragon2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon2_15_00"); //Øekni mi o tìch dracích víc.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01"); //Ale ne všichni draci jsou takoví.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02"); //Nìkteøí z nich mùou celou zem pokrıt vrstvou ledu nìkolik stop tlustou.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03"); //Jiní dávají pøednost ivotu v bainách nebo v sopeènıch kráterech.
	
	B_LogEntry (TOPIC_DRACHENJAGD,"Drakobijce Kjorn se domnívá, e drakù je nìkolik druhù. Nìkteøí si potrpí na chlad a vlhko, jiní zase dávají pøednost ohni."); 

	KjornToldDragon = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Das Minental -----

FUNC VOID DIA_Kjorn_BuyInfos_Colony1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony1_15_00"); //Øekni mi nìco o Hornickém údolí.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_01"); //Hornické údolí v Khorinidu je díky magické rudì známé po celé zemi.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_02"); //Tyhle hory jsou jedinım místem na svìtì, kde se magická ruda vyskytuje.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_03"); //Zbranì vyrobené z téhle rudy jsou prakticky neznièitelné a proniknou i tím nejlepším brnìním.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_04"); //Ještì pøed nìkolika tıdny celé údolí obklopovala magická bariéra. Byla neproniknutelná, a tak se nikdo nemohl dostat ven.

	KjornToldColony = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Colony2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony2_15_00"); //Øekni mi o tom údolí víc.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_01"); //Údolí se bìhem tìch nìkolika málo dní zmìnilo k nepoznání.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_02"); //Kdy pøišli skøeti, ukázaly se i další stvùry. Nic podobného tu nikdo nikdy pøedtím nevidìl.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_03"); //Øíká se, e tu ještì poøád zùstalo nìkolik osamìlıch lovcù, ale nejsem si zrovna jistı, jestli taky zùstali naivu.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_04"); //Vypadá to, jako by se do toho údolí stahovala všechna Beliarova stvoøení temnot.
	
	KjornToldColony = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Burg -----

FUNC VOID DIA_Kjorn_BuyInfos_OldCamp1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_OldCamp1_15_00"); //Øekni mi nìco o hradì.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01"); //Leí témìø uprostøed Hornického údolí.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02"); //Døív, kdy to údolí ještì slouilo jako vìzení, mìli veškerou rudu odtamtud pod palcem rudobaroni.
	
	KjornToldOldCamp = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Die Orks -----

FUNC VOID DIA_Kjorn_BuyInfos_Orks1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks1_15_00"); //Øekni mi nìco o skøetech.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_01"); //Ti skøeti tu nejsou moc dlouho. Alespoò ne ti, co jsou teï pøed hradem.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_02"); //Ale nejde mi na rozum, e jsou tak dobøe organizovaní. Skøeti vìtšinou útoèí hlava nehlava a je jim jedno na co.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_03"); //Tihle èekají na ten správnı èas. Èekají, ale my nevíme na co.
	
	KjornToldOrks = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Orks2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks2_15_00"); //Øekni mi o tìch skøetech víc.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_01"); //Ti skøeti jsou pod velením elitních váleèníkù. Mají obrovskou sílu a disponují vıbornımi zbrojemi. Je témìø nemoné je porazit.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_02"); //Jednou jsem vidìl, jak jeden z nich sloil vzrostlı dub jedinım máchnutím sekery.
	
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
	description	= "Zabil jsem všechny draky!";
				
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
	AI_Output	(other,self ,"DIA_Kjorn_AllDragonsDead_15_00"); //Zabil jsem všechny draky!
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_01"); //(smích) Jasnì, a já jsem paladin.
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_02"); //Moná se ti podaøilo zabít jednoho, ale všechny? Najdi si nìkoho jiného, kdo bude ochoten ti vìøit.
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


