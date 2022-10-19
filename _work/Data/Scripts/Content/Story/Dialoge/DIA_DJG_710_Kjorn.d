
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
	AI_Output	(self ,other,"DIA_Kjorn_Hello_06_00"); //Hey, komm mal her!
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_01"); //Was willst du?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_02"); //Das Tal ist ziemlich gef�hrlich und ohne die richtige Ausr�stung ist man hier schnell tot.
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_03"); //Ich nehme an, DU hast die richtige Ausr�stung.
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_04"); //Du hast es erraten. Ich w�rde sie dir sogar verkaufen.
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
	description	= "Was hast du anzubieten?";
				
};

FUNC INT DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_TRADE_Info()
{
	B_GiveTradeInv (self);
	AI_Output	(other,self ,"DIA_Kjorn_TRADE_15_00"); //Was hast du anzubieten?

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
	description	= "Verkaufst du auch Informationen?";
				
};

FUNC INT DIA_Kjorn_SellInfos_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_SellInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_SellInfos_15_00"); //Verkaufst du auch Informationen?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_01"); //Kommt drauf an. Wenn der Preis stimmt, werde ich dir alles sagen, was ich wei�.
	AI_Output 	(other,self ,"DIA_Kjorn_SellInfos_15_02"); //Wie viel verlangst du?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_03"); //Hmm, schwer zu sagen. Ich denke 50 Goldst�cke f�r jede Information, die ich dir gebe, sind angemessen.
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
	description	= "Ich brauche Informationen.";
				
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
	AI_Output	(other,self ,"DIA_Kjorn_BuyInfos_15_00"); //Ich brauche Informationen.
	AI_Output 	(self ,other,"DIA_Kjorn_BuyInfos_06_01"); //50 Goldst�cke!
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	Info_AddChoice (DIA_Kjorn_BuyInfos,"Das ist mir zu teuer.",DIA_Kjorn_BuyInfos_HoldMoney);	
	
	IF (Npc_HasItems (other,ItMi_Gold) >=50)
	{	
		Info_AddChoice (DIA_Kjorn_BuyInfos,"Ja, hier.",DIA_Kjorn_BuyInfos_GiveMoney);
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_HoldMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_HoldMoney_15_00"); //Das ist mir zu teuer.
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_GiveMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_00"); //Ja, hier.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_01"); //Jetzt erz�hl mir ...
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	
	//----- Zur�ck -----
	
	Info_AddChoice (DIA_Kjorn_BuyInfos,DIALOG_BACK,DIA_Kjorn_BuyInfos_Back);
	
	//----- Die Drachen -----
	
	if KjornToldDragon == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...�ber die Drachen.",DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if KjornToldDragon == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...mehr �ber die Drachen.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	
	//----- Das Minental -----
	
	if KjornToldColony == 0
	{	
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...�ber das Minental.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if KjornToldColony == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...mehr �ber das Minental.",DIA_Kjorn_BuyInfos_Colony2);
	};
	
	//----- die Burg -----
	
	if KJornToldOldCamp == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...�ber die Burg.",DIA_Kjorn_BuyInfos_OldCamp1);
	};
	
	//----- Die Orks -----
	
	if KjornToldOrks == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...�ber die Orks.",DIA_Kjorn_BuyInfos_Orks1);
	}
	else if KjornToldOrks == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...mehr �ber die Orks.",DIA_Kjorn_BuyInfos_Orks2);
	};	
	
};

//------ Zur�ck -----

FUNC VOID DIA_Kjorn_BuyInfos_Back ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Back_15_00"); //Ach, gib mir einfach mein Gold zur�ck, ich hab's mir �berlegt.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Back_06_01"); //Wie du meinst.
	
	B_GiveInvItems (self,other,ItMi_Gold,50);
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Drachen -----

FUNC VOID DIA_Kjorn_BuyInfos_Dragon1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon1_15_00"); //Erz�hl mir etwas �ber die Drachen.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01"); //Drachen sind uralte Gesch�pfe von unglaublicher Macht. Einst lebten Tausende von ihnen auf der ganzen Welt verteilt.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02"); //Seit �ber hundert Jahren hat man keinen mehr von ihnen gesehen.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03"); //Ihr Blut ist hei� wie siedendes �l. Wenn sie dir in die Augen blicken, verwandelt sich dein Herz in Stein. Hab ich geh�rt ...
	
	KjornToldDragon = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Dragon2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon2_15_00"); //Erz�hl mir mehr �ber die Drachen.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01"); //Drache ist nicht gleich Drache.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02"); //Es gibt einige, die das gesamte Land mit einer meterdicken Eisschicht bedecken k�nnen.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03"); //Andere leben lieber in sumpfiger Umgebung oder in Vulkanen.
	
	B_LogEntry (TOPIC_DRACHENJAGD,"Kjorn der Drachenj�ger ist der Meinung, dass es verschiedene Arten von Drachen gibt. Einige halten sich angeblich lieber in kalten oder feuchten Gebieten auf, w�hrend andere das Feuer bevorzugen."); 

	KjornToldDragon = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Das Minental -----

FUNC VOID DIA_Kjorn_BuyInfos_Colony1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony1_15_00"); //Erz�hl mir etwas �ber das Minental.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_01"); //Das Minental von Khorinis ist im gesamten Land f�r sein magisches Erz ber�hmt.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_02"); //Diese Berge sind der einzige Ort, wo man das magische Erz finden kann.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_03"); //Eine aus diesem Erz geschmiedete Waffe ist nahezu unzerbrechlich und durchschneidet die st�rkste R�stung.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_04"); //Bis vor wenigen Wochen war das gesamte Tal von einer magischen Barriere umgeben, die undurchdringlich war und niemanden heraus gelassen hat.

	KjornToldColony = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Colony2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony2_15_00"); //Erz�hl mir mehr �ber das Minental.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_01"); //Das Tal hat sich sehr ver�ndert in den letzten Tagen.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_02"); //Mit dem Auftauchen der Orks sind noch andere furchteinfl��ende Kreaturen gekommen, die es hier vorher nicht gegeben hat.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_03"); //Es soll hier noch vereinzelt ein paar J�ger geben, allerdings bin ich mir nicht sicher, ob die �berhaupt noch leben.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_04"); //Das ganze Tal wirkt, als ob sich hier alle Gesch�pfe Beliars zusammengerottet haben.
	
	KjornToldColony = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Burg -----

FUNC VOID DIA_Kjorn_BuyInfos_OldCamp1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_OldCamp1_15_00"); //Erz�hl mir etwas �ber die Burg.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01"); //Sie liegt ziemlich im Zentrum des Minentals.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02"); //Als das Tal noch ein Gef�ngnis war, haben die Erzbarone von dort den gesamten Erzhandel kontrolliert.
	
	KjornToldOldCamp = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Die Orks -----

FUNC VOID DIA_Kjorn_BuyInfos_Orks1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks1_15_00"); //Erz�hl mir etwas �ber die Orks.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_01"); //Die Orks sind erst seit kurzem hier. Ich meine, zumindest die Orks vor der Burg.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_02"); //Allerdings wundere ich mich, wie gut sie organisiert sind. Normalerweise greifen Orks ohne R�cksicht auf Verluste an.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_03"); //Diese Orks warten ab. Ich wei� nicht auf was, aber sie warten.
	
	KjornToldOrks = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Orks2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks2_15_00"); //Erz�hl mir mehr �ber die Orks.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_01"); //Angef�hrt werden die Orks von Elitekriegern. Diese Krieger sind sehr stark und schwer ger�stet. Sie zu besiegen ist fast unm�glich.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_02"); //Ich habe mal gesehen, wie einer von ihnen eine ausgewachsene Eiche mit einem Hieb seiner Axt gef�llt hat.
	
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
	description	= "Ich habe alle Drachen get�tet!";
				
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
	AI_Output	(other,self ,"DIA_Kjorn_AllDragonsDead_15_00"); //Ich habe alle Drachen get�tet!
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_01"); //(lacht) Klar, und ich bin Paladin.
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_02"); //Du hast vielleicht EINEN get�tet, aber alle? Das kannst du einem anderen erz�hlen.
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


