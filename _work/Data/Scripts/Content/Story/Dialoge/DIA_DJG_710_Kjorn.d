
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
	AI_Output	(self ,other,"DIA_Kjorn_Hello_06_00"); //Ehi, vieni qui!
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_01"); //Che vuoi?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_02"); //Questa valle è un posto pericoloso, e senza il giusto equipaggiamento ti ritroveresti morto senza neanche accorgertene.
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_03"); //Suppongo che TU abbia l'equipaggiamento giusto.
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_04"); //Hai indovinato. E potrei anche vendertelo.
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
	description	= "Cosa puoi offrirmi?";
				
};

FUNC INT DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_TRADE_Info()
{
	B_GiveTradeInv (self);
	AI_Output	(other,self ,"DIA_Kjorn_TRADE_15_00"); //Cosa puoi offrirmi?

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
	description	= "Vendi anche informazioni?";
				
};

FUNC INT DIA_Kjorn_SellInfos_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_SellInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_SellInfos_15_00"); //Vendi anche informazioni?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_01"); //Dipende. Se mi pagherai bene, ti dirò tutto quello che so.
	AI_Output 	(other,self ,"DIA_Kjorn_SellInfos_15_02"); //Quanto vuoi?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_03"); //Mmmh... difficile a dirsi. Ma credo che 50 monete d'oro per ogni informazione dovrebbero andare bene.
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
	description	= "Mi servono alcune informazioni.";
				
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
	AI_Output	(other,self ,"DIA_Kjorn_BuyInfos_15_00"); //Mi servono alcune informazioni.
	AI_Output 	(self ,other,"DIA_Kjorn_BuyInfos_06_01"); //50 monete d'oro!
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	Info_AddChoice (DIA_Kjorn_BuyInfos,"Il prezzo è troppo alto per me.",DIA_Kjorn_BuyInfos_HoldMoney);	
	
	IF (Npc_HasItems (other,ItMi_Gold) >=50)
	{	
		Info_AddChoice (DIA_Kjorn_BuyInfos,"Sì, qui.",DIA_Kjorn_BuyInfos_GiveMoney);
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_HoldMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_HoldMoney_15_00"); //Il prezzo è troppo alto per me.
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_GiveMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_00"); //Sì, ecco.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_01"); //Ora parla...
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	
	//----- Zurück -----
	
	Info_AddChoice (DIA_Kjorn_BuyInfos,DIALOG_BACK,DIA_Kjorn_BuyInfos_Back);
	
	//----- Die Drachen -----
	
	if KjornToldDragon == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...sui draghi.",DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if KjornToldDragon == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...altre informazioni sui draghi.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	
	//----- Das Minental -----
	
	if KjornToldColony == 0
	{	
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...sulla Valle delle Miniere.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if KjornToldColony == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...altre informazioni sulla Valle delle Miniere.",DIA_Kjorn_BuyInfos_Colony2);
	};
	
	//----- die Burg -----
	
	if KJornToldOldCamp == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...sul castello.",DIA_Kjorn_BuyInfos_OldCamp1);
	};
	
	//----- Die Orks -----
	
	if KjornToldOrks == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...sugli orchi.",DIA_Kjorn_BuyInfos_Orks1);
	}
	else if KjornToldOrks == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...altre informazioni sugli orchi.",DIA_Kjorn_BuyInfos_Orks2);
	};	
	
};

//------ Zurück -----

FUNC VOID DIA_Kjorn_BuyInfos_Back ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Back_15_00"); //Sai, ho cambiato idea. Ridammi indietro i miei soldi.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Back_06_01"); //Fai come ti pare.
	
	B_GiveInvItems (self,other,ItMi_Gold,50);
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Drachen -----

FUNC VOID DIA_Kjorn_BuyInfos_Dragon1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon1_15_00"); //Parlami dei draghi.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01"); //I draghi sono delle creature antiche incredibilmente potenti. Una volta ce n'erano a migliaia in tutto il mondo.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02"); //Sono trascorsi oltre cento anni dall'ultima volta che se n'è visto uno.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03"); //Il loro sangue è caldo come l'olio bollente. Possono tramutare il tuo cuore in pietra con un solo sguardo. O almeno così ho sentito dire...
	
	KjornToldDragon = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Dragon2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon2_15_00"); //Dimmi di più sui draghi.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01"); //Ma non tutti i draghi sono uguali.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02"); //Alcuni di loro possono addirittura ricoprire l'intera regione con uno strato di ghiaccio spesso diversi metri.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03"); //Altri preferiscono vivere in ambienti paludosi, o nei vulcani.
	
	B_LogEntry (TOPIC_DRACHENJAGD,"Kjorn il cacciatore di draghi pensa che esistano diversi tipi di draghi. Alcuni preferiscono il freddo, altri i luoghi umidi, altri ancora il fuoco."); 

	KjornToldDragon = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Das Minental -----

FUNC VOID DIA_Kjorn_BuyInfos_Colony1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony1_15_00"); //Parlami della Valle delle Miniere.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_01"); //La Valle delle Miniere di Khorinis è conosciuta in tutto il paese per il suo metallo magico.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_02"); //Queste montagne sono l'unico posto dov'è possibile trovare il metallo magico.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_03"); //Un'arma forgiata con questo metallo è praticamente indistruttibile, ed è in grado di penetrare anche la corazza più resistente.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_04"); //Fino a un paio di settimane fa, l'intera valle era circondata da una barriera magica impenetrabile, dalla quale nessuno poteva fuggire.

	KjornToldColony = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Colony2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony2_15_00"); //Dimmi di più sulla Valle delle Miniere.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_01"); //La valle è cambiata parecchio ultimamente.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_02"); //Quando sono arrivati gli orchi, sono comparse anche altre creature orribili mai viste da queste parti.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_03"); //Dicono che solo un gruppetto di cacciatori solitari si sia offerto di dargli la caccia, ma non sono sicuro che siano ancora vivi.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_04"); //Sembra che tutte le creature di Beliar si siano radunate in questa vallata.
	
	KjornToldColony = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Burg -----

FUNC VOID DIA_Kjorn_BuyInfos_OldCamp1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_OldCamp1_15_00"); //Parlami del castello.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01"); //Si trova esattamente al centro della Valle delle Miniere.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02"); //Quando la valle era ancora una prigione, i baroni del metallo controllavano tutti i loro commerci da lì.
	
	KjornToldOldCamp = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Die Orks -----

FUNC VOID DIA_Kjorn_BuyInfos_Orks1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks1_15_00"); //Parlami degli orchi.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_01"); //Gli orchi sono arrivati da poco. Almeno quelli di fronte al castello.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_02"); //Ma mi chiedo quanto siano bene organizzati. Gli orchi di solito attaccano alla cieca, senza preoccuparsi.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_03"); //Questi orchi stanno aspettando il momento giusto. Sono lì che attendono, ma non sappiamo cosa.
	
	KjornToldOrks = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Orks2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks2_15_00"); //Dimmi di più sugli orchi.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_01"); //Gli orchi sono guidati da un'élite di guerrieri molto forti e pesantemente corazzati, tanto da essere praticamente invincibili.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_02"); //Una volta ho visto uno di loro abbattere una quercia adulta con un solo colpo di ascia.
	
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
	description	= "Ho ucciso tutti i draghi!";
				
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
	AI_Output	(other,self ,"DIA_Kjorn_AllDragonsDead_15_00"); //Ho ucciso tutti i draghi!
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_01"); //(ride) Certo, e io sono un paladino.
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_02"); //Potrai averne ucciso UNO, ma non tutti quanti! Vai a raccontare queste frottole a qualcun altro.
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


