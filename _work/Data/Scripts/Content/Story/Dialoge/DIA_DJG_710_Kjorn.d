
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
	AI_Output	(self ,other,"DIA_Kjorn_Hello_06_00"); //Hej, pojď sem!
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_01"); //Co chceš?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_02"); //Tohle údolí je nebezpečné místo a bez pořádného vybavení budeš mrtvej, ani se nenaděješ.
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_03"); //Předpokládám, že to pořádné vybavení najdu u TEBE.
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_04"); //To se vsaď. Dokonce ti ho můžu prodat.
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
	description	= "Co mi můžeš nabídnout?";
				
};

FUNC INT DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_TRADE_Info()
{
	B_GiveTradeInv (self);
	AI_Output	(other,self ,"DIA_Kjorn_TRADE_15_00"); //Co mi můžeš nabídnout?

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
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_01"); //Přijde na to. Pokud je dobrá cena, řeknu všechno, co vím.
	AI_Output 	(other,self ,"DIA_Kjorn_SellInfos_15_02"); //Kolik?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_03"); //Hmm... těžko říct. Ale myslím, že 50 zlatých za každou poskytnutou informaci je docela dobrá cena.
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
	description	= "Potřebuju nějaké informace.";
				
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
	AI_Output	(other,self ,"DIA_Kjorn_BuyInfos_15_00"); //Potřebuju nějaké informace.
	AI_Output 	(self ,other,"DIA_Kjorn_BuyInfos_06_01"); //50 zlatých!
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	Info_AddChoice (DIA_Kjorn_BuyInfos,"To je pro mě moc drahé.",DIA_Kjorn_BuyInfos_HoldMoney);	
	
	IF (Npc_HasItems (other,ItMi_Gold) >=50)
	{	
		Info_AddChoice (DIA_Kjorn_BuyInfos,"Ano, tady.",DIA_Kjorn_BuyInfos_GiveMoney);
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_HoldMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_HoldMoney_15_00"); //To je pro mě moc drahé.
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_GiveMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_00"); //Ano, tady.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_01"); //A teď mi řekni...
	
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
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...ještě něco o dracích.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	
	//----- Das Minental -----
	
	if KjornToldColony == 0
	{	
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o Hornickém údolí.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if KjornToldColony == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...ještě něco o Hornickém údolí.",DIA_Kjorn_BuyInfos_Colony2);
	};
	
	//----- die Burg -----
	
	if KJornToldOldCamp == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o hradu.",DIA_Kjorn_BuyInfos_OldCamp1);
	};
	
	//----- Die Orks -----
	
	if KjornToldOrks == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o skřetech.",DIA_Kjorn_BuyInfos_Orks1);
	}
	else if KjornToldOrks == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...ještě něco o skřetech.",DIA_Kjorn_BuyInfos_Orks2);
	};	
	
};

//------ Zurück -----

FUNC VOID DIA_Kjorn_BuyInfos_Back ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Back_15_00"); //Víš, rozmyslel jsem si to. Vrať mi moje peníze.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Back_06_01"); //Jak je libo.
	
	B_GiveInvItems (self,other,ItMi_Gold,50);
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Drachen -----

FUNC VOID DIA_Kjorn_BuyInfos_Dragon1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon1_15_00"); //Řekni mi něco o dracích.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01"); //Draci jsou pradávná, neuvěřitelně mocná stvoření. Kdysi jich žily tisíce po celém světě.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02"); //Ale už je to přes sto let, co některého z nich někdo viděl.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03"); //Jejich krev je horká jako vroucí olej. Když se ti podívají do očí, promění se tvé srdce v kámen. Tak jsem to alespoň slyšel.
	
	KjornToldDragon = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Dragon2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon2_15_00"); //Řekni mi o těch dracích víc.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01"); //Ale ne všichni draci jsou takoví.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02"); //Někteří z nich můžou celou zem pokrýt vrstvou ledu několik stop tlustou.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03"); //Jiní dávají přednost životu v bažinách nebo v sopečných kráterech.
	
	B_LogEntry (TOPIC_DRACHENJAGD,"Drakobijce Kjorn se domnívá, že draků je několik druhů. Někteří si potrpí na chlad a vlhko, jiní zase dávají přednost ohni."); 

	KjornToldDragon = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Das Minental -----

FUNC VOID DIA_Kjorn_BuyInfos_Colony1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony1_15_00"); //Řekni mi něco o Hornickém údolí.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_01"); //Hornické údolí v Khorinidu je díky magické rudě známé po celé zemi.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_02"); //Tyhle hory jsou jediným místem na světě, kde se magická ruda vyskytuje.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_03"); //Zbraně vyrobené z téhle rudy jsou prakticky nezničitelné a proniknou i tím nejlepším brněním.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_04"); //Ještě před několika týdny celé údolí obklopovala magická bariéra. Byla neproniknutelná, a tak se nikdo nemohl dostat ven.

	KjornToldColony = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Colony2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony2_15_00"); //Řekni mi o tom údolí víc.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_01"); //Údolí se během těch několika málo dní změnilo k nepoznání.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_02"); //Když přišli skřeti, ukázaly se i další stvůry. Nic podobného tu nikdo nikdy předtím neviděl.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_03"); //Říká se, že tu ještě pořád zůstalo několik osamělých lovců, ale nejsem si zrovna jistý, jestli taky zůstali naživu.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_04"); //Vypadá to, jako by se do toho údolí stahovala všechna Beliarova stvoření temnot.
	
	KjornToldColony = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Burg -----

FUNC VOID DIA_Kjorn_BuyInfos_OldCamp1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_OldCamp1_15_00"); //Řekni mi něco o hradě.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01"); //Leží téměř uprostřed Hornického údolí.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02"); //Dřív, když to údolí ještě sloužilo jako vězení, měli veškerou rudu odtamtud pod palcem rudobaroni.
	
	KjornToldOldCamp = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Die Orks -----

FUNC VOID DIA_Kjorn_BuyInfos_Orks1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks1_15_00"); //Řekni mi něco o skřetech.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_01"); //Ti skřeti tu nejsou moc dlouho. Alespoň ne ti, co jsou teď před hradem.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_02"); //Ale nejde mi na rozum, že jsou tak dobře organizovaní. Skřeti většinou útočí hlava nehlava a je jim jedno na co.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_03"); //Tihle čekají na ten správný čas. Čekají, ale my nevíme na co.
	
	KjornToldOrks = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Orks2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks2_15_00"); //Řekni mi o těch skřetech víc.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_01"); //Ti skřeti jsou pod velením elitních válečníků. Mají obrovskou sílu a disponují výbornými zbrojemi. Je téměř nemožné je porazit.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_02"); //Jednou jsem viděl, jak jeden z nich složil vzrostlý dub jediným máchnutím sekery.
	
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
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_01"); //(smích) Jasně, a já jsem paladin.
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_02"); //Možná se ti podařilo zabít jednoho, ale všechny? Najdi si někoho jiného, kdo bude ochoten ti věřit.
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


