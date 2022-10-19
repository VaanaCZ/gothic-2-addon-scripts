// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Rupert_EXIT(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 999;
	condition	= DIA_Rupert_EXIT_Condition;
	information	= DIA_Rupert_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Rupert_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Rupert_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rupert_PICKPOCKET (C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 900;
	condition	= DIA_Rupert_PICKPOCKET_Condition;
	information	= DIA_Rupert_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Rupert_PICKPOCKET_Condition()
{
	C_Beklauen (18, 10);
};
 
FUNC VOID DIA_Rupert_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rupert_PICKPOCKET);
	Info_AddChoice		(DIA_Rupert_PICKPOCKET, DIALOG_BACK 		,DIA_Rupert_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rupert_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rupert_PICKPOCKET_DoIt);
};

func void DIA_Rupert_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rupert_PICKPOCKET);
};
	
func void DIA_Rupert_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rupert_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
INSTANCE DIA_Rupert_Hello(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_Hello_Condition;
	information	= DIA_Rupert_Hello_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Rupert_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Rupert_Hello_03_00"); //Salve, straniero!
	AI_Output (self ,other,"DIA_Rupert_Hello_03_01"); //Devi essere assetato e affamato, posso forse mostrarti la mia merce?
};	

// ************************************************************
// 			  				 Zu Pal 
// ************************************************************
INSTANCE DIA_Rupert_ZuPal(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_ZuPal_Condition;
	information	= DIA_Rupert_ZuPal_Info;
	permanent	= FALSE;
	description = "Veramente, mi stavo dirigendo dai paladini...";
};                       
FUNC INT DIA_Rupert_ZuPal_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_ZuPal_Info()
{	
	AI_Output (other, self,"DIA_Rupert_ZuPal_15_00"); //Veramente, mi stavo dirigendo dai paladini...
	AI_Output (self ,other,"DIA_Rupert_ZuPal_03_01"); //Hai poche possibilità visto che i paladini si sono sistemati nella parte alta della città e praticamente nessuno riesce più a metterci piede.
};	

// ************************************************************
// 			  			HelpMeIntoOV
// ************************************************************
INSTANCE DIA_Rupert_HelpMeIntoOV(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_HelpMeIntoOV_Condition;
	information	= DIA_Rupert_HelpMeIntoOV_Info;
	permanent	= FALSE;
	description = "Puoi aiutarmi a raggiungere il quartiere alto?";
};                       
FUNC INT DIA_Rupert_HelpMeIntoOV_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rupert_ZuPal))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_HelpMeIntoOV_Info()
{	
	AI_Output (other, self,"DIA_Rupert_HelpMeIntoOV_15_00"); //Puoi aiutarmi a raggiungere il quartiere alto?
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_01"); //Io? No, non ho molto da dire a riguardo!
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_02"); //Ci sono solo poche persone nella parte bassa della città che hanno abbastanza influenza per permetterti di passare oltre le guardie.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_03"); //Matteo, il mio capo, è uno di queste. Forse dovresti parlargli.
	
	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Se voglio entrare nei quartieri alti, dovrò trovare l'aiuto di qualche cittadino autorevole della parte inferiore.");
	B_LogEntry (TOPIC_OV,"Matteo il mercante è uno dei cittadini più influenti della parte inferiore della città.");
};	

// ***************************************************************
//							WoMatteo
// ***************************************************************
INSTANCE DIA_Rupert_WoMatteo(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_WoMatteo_Condition;
	information	= DIA_Rupert_WoMatteo_Info;
	permanent	= FALSE;
	description = "Dove si trova Matteo?";
};                      
FUNC INT DIA_Rupert_WoMatteo_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_WoMatteo_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_WoMatteo_15_00"); //Dove si trova Matteo?
	AI_Output (self ,other,"DIA_Rupert_WoMatteo_03_01"); //Sei proprio fuori dal suo negozio. Entra, è praticamente sempre lì.
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Il negozio di Matteo è al cancello sud della città. Vende equipaggiamento, armi e provviste.");
		Knows_Matteo = TRUE;
	};
};

// ***************************************************************
//							Wer hat Einfluß
// ***************************************************************
INSTANCE DIA_Rupert_WerEinfluss(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 2;
	condition	= DIA_Rupert_WerEinfluss_Condition;
	information	= DIA_Rupert_WerEinfluss_Info;
	permanent	= FALSE;
	description = "Cosa mi dici dei cittadini importanti?";
};                      
FUNC INT DIA_Rupert_WerEinfluss_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_WerEinfluss_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_WerEinfluss_15_00"); //Cosa mi dici dei cittadini importanti?
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_01"); //I mercanti e i maestri artigiani si trovano sulla strada principale e sono le figure più importanti in città.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_02"); //Dovresti provare a farti accettare come apprendista da uno di loro, come ho fatto io.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_03"); //Da quando ho cominciato a lavorare per Matteo, la gente in città mi tratta con rispetto!
	
	B_LogEntry (TOPIC_OV,"Dovrei cominciare a lavorare come apprendista per uno dei mastri artigiani.");
};

// ***************************************************************
//							Work
// ***************************************************************
INSTANCE DIA_Rupert_Work(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 3;
	condition	= DIA_Rupert_Work_Condition;
	information	= DIA_Rupert_Work_Info;
	permanent	= FALSE;
	description = "Mi serve del denaro e sto cercando un lavoro.";
};                      
FUNC INT DIA_Rupert_Work_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_Work_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Work_15_00"); //Mi serve del denaro e sto cercando un lavoro.
	AI_Output (self ,other,"DIA_Rupert_Work_03_01"); //Ho sentito che Bosper ha dei problemi con i suoi fornitori. Il suo negozio è laggiù.
	AI_Output (self ,other,"DIA_Rupert_Work_03_02"); //Dicono che paghi bene.
};

// ***************************************************************
//							YourOffer
// ***************************************************************
INSTANCE DIA_Rupert_YourOffer(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_YourOffer_Condition;
	information	= DIA_Rupert_YourOffer_Info;
	permanent	= FALSE;
	description = "Cosa puoi offrirmi?";
};                      
FUNC INT DIA_Rupert_YourOffer_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Rupert_YourOffer_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_YourOffer_15_00"); //Cos’hai da offrirmi?
	AI_Output (self ,other,"DIA_Rupert_YourOffer_03_01"); //Al momento, non ho molta scelta.
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{ 
		AI_Output (self ,other,"DIA_Rupert_YourOffer_03_02"); //Quel maledetto possidente non fa più consegne e quello che otteniamo dalle fattorie più piccole non è abbastanza per soddisfare le richieste della città.
	};
};

// ************************************************************
//								Trade
// ************************************************************
INSTANCE DIA_Rupert_Trade(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 900;
	condition	= DIA_Rupert_Trade_Condition;
	information	= DIA_Rupert_Trade_Info;
	permanent	= TRUE;
	description = "Mostrami la mercanzia.";
	trade		= TRUE;
};                       
FUNC INT DIA_Rupert_Trade_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_YourOffer))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_Trade_Info()
{	
	if (Npc_HasItems (self, itfo_cheese) < 5)
	{
		CreateInvItems (self, ItFo_cheese, 5);
	};
	
	AI_Output (other,self ,"DIA_Rupert_Trade_15_00"); //Mostrami la mercanzia.
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output (self,other,"DIA_Rupert_Trade_03_01"); //Perdonami per la ridotta scelta. Un uomo nella tua posizione è sicuramente abituato meglio.
	};
};

// ************************************************************
// 			  				 Bauernaufstand
// ************************************************************
INSTANCE DIA_Rupert_Bauernaufstand(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_Bauernaufstand_Condition;
	information	= DIA_Rupert_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "Parlami ancora della rivoluzione contadina.";
};                       
FUNC INT DIA_Rupert_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Rupert_YourOffer))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Bauernaufstand_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Bauernaufstand_15_00"); //Parlami ancora della rivoluzione contadina.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_01"); //È molto semplice: il possidente Onar non pagherà più le tasse alla città.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_02"); //Pensa te! Siamo in guerra con gli orchi e quel ciccione vuole tenere tutto per sé!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_03"); //In genere, la guardia cittadina prenderebbe delle misure in caso come questi.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_04"); //Ma adesso viene la parte migliore: dicono che Onar abbia assunto dei mercenari per tenere le truppe della città lontano da lui!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_05"); //MERCENARI! L'intera faccenda sfocerà in una guerra! Come se UNA non fosse già abbastanza!
};

// ***************************************************************
//							Söldner
// ***************************************************************
INSTANCE DIA_Rupert_Mercs(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_Mercs_Condition;
	information	= DIA_Rupert_Mercs_Info;
	permanent	= FALSE;
	description = "Cosa puoi dirmi sui mercenari si Onar?";
};                       
FUNC INT DIA_Rupert_Mercs_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Rupert_Bauernaufstand))
	&& (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Mercs_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Mercs_15_00"); //Cosa puoi dirmi sui mercenari di Onar?
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_01"); //Ho sentito dire che la maggior parte di loro sono degli ex detenuti della colonia mineraria.
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_02"); //E pare che il loro capo sia stato un pezzo grosso del Re un tempo, un generale o qualcosa del genere, ma è stato allontanato per tradimento!
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_03"); //Sono tempi terribili.
};



