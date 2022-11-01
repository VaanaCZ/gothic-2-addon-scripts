
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
	AI_Output	(self ,other,"DIA_Kjorn_Hello_06_00"); //Hej, pojë sem!
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_01"); //Co chceš?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_02"); //Tohle údolí je nebezpečné místo a bez poâádného vybavení budeš mrtvej, ani se nenadęješ.
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_03"); //Pâedpokládám, že to poâádné vybavení najdu u TEBE.
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_04"); //To se vsaë. Dokonce ti ho můžu prodat.
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
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_01"); //Pâijde na to. Pokud je dobrá cena, âeknu všechno, co vím.
	AI_Output 	(other,self ,"DIA_Kjorn_SellInfos_15_02"); //Kolik?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_03"); //Hmm... tęžko âíct. Ale myslím, že 50 zlatých za každou poskytnutou informaci je docela dobrá cena.
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
	description	= "Potâebuju nęjaké informace.";
				
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
	AI_Output	(other,self ,"DIA_Kjorn_BuyInfos_15_00"); //Potâebuju nęjaké informace.
	AI_Output 	(self ,other,"DIA_Kjorn_BuyInfos_06_01"); //50 zlatých!
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	Info_AddChoice (DIA_Kjorn_BuyInfos,"To je pro mę moc drahé.",DIA_Kjorn_BuyInfos_HoldMoney);	
	
	IF (Npc_HasItems (other,ItMi_Gold) >=50)
	{	
		Info_AddChoice (DIA_Kjorn_BuyInfos,"Ano, tady.",DIA_Kjorn_BuyInfos_GiveMoney);
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_HoldMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_HoldMoney_15_00"); //To je pro mę moc drahé.
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_GiveMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_00"); //Ano, tady.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_01"); //A teë mi âekni...
	
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
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...ještę nęco o dracích.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	
	//----- Das Minental -----
	
	if KjornToldColony == 0
	{	
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o Hornickém údolí.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if KjornToldColony == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...ještę nęco o Hornickém údolí.",DIA_Kjorn_BuyInfos_Colony2);
	};
	
	//----- die Burg -----
	
	if KJornToldOldCamp == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o hradu.",DIA_Kjorn_BuyInfos_OldCamp1);
	};
	
	//----- Die Orks -----
	
	if KjornToldOrks == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o skâetech.",DIA_Kjorn_BuyInfos_Orks1);
	}
	else if KjornToldOrks == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...ještę nęco o skâetech.",DIA_Kjorn_BuyInfos_Orks2);
	};	
	
};

//------ Zurück -----

FUNC VOID DIA_Kjorn_BuyInfos_Back ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Back_15_00"); //Víš, rozmyslel jsem si to. Vraă mi moje peníze.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Back_06_01"); //Jak je libo.
	
	B_GiveInvItems (self,other,ItMi_Gold,50);
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Drachen -----

FUNC VOID DIA_Kjorn_BuyInfos_Dragon1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon1_15_00"); //Âekni mi nęco o dracích.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01"); //Draci jsou pradávná, neuvęâitelnę mocná stvoâení. Kdysi jich žily tisíce po celém svętę.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02"); //Ale už je to pâes sto let, co nękterého z nich nękdo vidęl.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03"); //Jejich krev je horká jako vroucí olej. Když se ti podívají do očí, promęní se tvé srdce v kámen. Tak jsem to alespoŕ slyšel.
	
	KjornToldDragon = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Dragon2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon2_15_00"); //Âekni mi o tęch dracích víc.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01"); //Ale ne všichni draci jsou takoví.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02"); //Nękteâí z nich můžou celou zem pokrýt vrstvou ledu nękolik stop tlustou.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03"); //Jiní dávají pâednost životu v bažinách nebo v sopečných kráterech.
	
	B_LogEntry (TOPIC_DRACHENJAGD,"Drakobijce Kjorn se domnívá, že draků je nękolik druhů. Nękteâí si potrpí na chlad a vlhko, jiní zase dávají pâednost ohni."); 

	KjornToldDragon = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Das Minental -----

FUNC VOID DIA_Kjorn_BuyInfos_Colony1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony1_15_00"); //Âekni mi nęco o Hornickém údolí.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_01"); //Hornické údolí v Khorinidu je díky magické rudę známé po celé zemi.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_02"); //Tyhle hory jsou jediným místem na svętę, kde se magická ruda vyskytuje.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_03"); //Zbranę vyrobené z téhle rudy jsou prakticky nezničitelné a proniknou i tím nejlepším brnęním.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_04"); //Ještę pâed nękolika týdny celé údolí obklopovala magická bariéra. Byla neproniknutelná, a tak se nikdo nemohl dostat ven.

	KjornToldColony = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Colony2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony2_15_00"); //Âekni mi o tom údolí víc.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_01"); //Údolí se bęhem tęch nękolika málo dní zmęnilo k nepoznání.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_02"); //Když pâišli skâeti, ukázaly se i další stvůry. Nic podobného tu nikdo nikdy pâedtím nevidęl.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_03"); //Âíká se, že tu ještę poâád zůstalo nękolik osamęlých lovců, ale nejsem si zrovna jistý, jestli taky zůstali naživu.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_04"); //Vypadá to, jako by se do toho údolí stahovala všechna Beliarova stvoâení temnot.
	
	KjornToldColony = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Burg -----

FUNC VOID DIA_Kjorn_BuyInfos_OldCamp1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_OldCamp1_15_00"); //Âekni mi nęco o hradę.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01"); //Leží témęâ uprostâed Hornického údolí.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02"); //Dâív, když to údolí ještę sloužilo jako vęzení, męli veškerou rudu odtamtud pod palcem rudobaroni.
	
	KjornToldOldCamp = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Die Orks -----

FUNC VOID DIA_Kjorn_BuyInfos_Orks1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks1_15_00"); //Âekni mi nęco o skâetech.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_01"); //Ti skâeti tu nejsou moc dlouho. Alespoŕ ne ti, co jsou teë pâed hradem.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_02"); //Ale nejde mi na rozum, že jsou tak dobâe organizovaní. Skâeti vętšinou útočí hlava nehlava a je jim jedno na co.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_03"); //Tihle čekají na ten správný čas. Čekají, ale my nevíme na co.
	
	KjornToldOrks = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Orks2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks2_15_00"); //Âekni mi o tęch skâetech víc.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_01"); //Ti skâeti jsou pod velením elitních válečníků. Mají obrovskou sílu a disponují výbornými zbrojemi. Je témęâ nemožné je porazit.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_02"); //Jednou jsem vidęl, jak jeden z nich složil vzrostlý dub jediným máchnutím sekery.
	
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
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_01"); //(smích) Jasnę, a já jsem paladin.
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_02"); //Možná se ti podaâilo zabít jednoho, ale všechny? Najdi si nękoho jiného, kdo bude ochoten ti vęâit.
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


