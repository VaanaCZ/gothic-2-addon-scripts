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
	AI_Output (self ,other,"DIA_Rupert_Hello_03_00"); //Haló, cizinče!
	AI_Output (self ,other,"DIA_Rupert_Hello_03_01"); //Musíš mít pořádný hlad a žízeň - mohl bych ti snad ukázat své zboží?
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
	description = "Potřebuju si promluvit s paladiny...";
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
	AI_Output (other, self,"DIA_Rupert_ZuPal_15_00"); //Potřebuju si promluvit s paladiny.
	AI_Output (self ,other,"DIA_Rupert_ZuPal_03_01"); //Tak to máš jen malou naději. Od té doby, co paladinové zabrali horní část města, se tam jen tak někdo nedostane.
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
	description = "Můžeš mi pomoci proniknout do horní čtvrti?";
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
	AI_Output (other, self,"DIA_Rupert_HelpMeIntoOV_15_00"); //Můžeš mi pomoci proniknout do horní čtvrti?
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_01"); //Já? Ne, nemám tady příliš velké slovo.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_02"); //V dolní části města je jen pár lidí, kteří mají dostatečný vliv, aby se dostali přes stráže.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_03"); //Matteo, můj pán, je jedním z nich. Možná by sis s ním měl promluvit.
	
	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Jestli se mám dostat do horní čtvrti, musí mi v tom pomoci nějací vlivní občané z dolní části města.");
	B_LogEntry (TOPIC_OV,"Jedním z vlivných občanů dolní části města je obchodník Matteo.");
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
	description = "Kde najdu Mattea?";
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
	AI_Output (other,self ,"DIA_Rupert_WoMatteo_15_00"); //Kde najdu Mattea?
	AI_Output (self ,other,"DIA_Rupert_WoMatteo_03_01"); //Stojíš přímo před jeho krámkem. Stačí jen vejít. Je tam skoro pořád.
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Matteův obchod leží u jižní městské brány. Prodává vybavení, zbraně i potraviny.");
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
	description = "A co ti ostatní vlivní měšťané?";
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
	AI_Output (other,self ,"DIA_Rupert_WerEinfluss_15_00"); //A co ti ostatní vlivní měšťané?
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_01"); //Obchodníci a mistr tesař tady na hlavní ulici jsou nejvlivnějšími osobami ve městě.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_02"); //Měl by ses pokusit o přijetí za učedníka u jednoho z nich - jako já.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_03"); //Od té doby, co pracuju pro Mattea, se ke mně lidé ve městě chovají s úctou!
	
	B_LogEntry (TOPIC_OV,"Měl bych vstoupit do učení k některému z místních řemeslnických mistrů.");
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
	description = "Potřebuju trochu peněz a poohlížím se po práci.";
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
	AI_Output (other,self ,"DIA_Rupert_Work_15_00"); //Potřebuju trochu peněz a poohlížím se po práci.
	AI_Output (self ,other,"DIA_Rupert_Work_03_01"); //Slyšel jsem, že má problémy se svým nástupcem. Jeho dílna je přímo naproti.
	AI_Output (self ,other,"DIA_Rupert_Work_03_02"); //Říká se, že platí velice slušně.
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
	description = "Co mi můžeš nabídnout?";
};                      
FUNC INT DIA_Rupert_YourOffer_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Rupert_YourOffer_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_YourOffer_15_00"); //Co máš na prodej?
	AI_Output (self ,other,"DIA_Rupert_YourOffer_03_01"); //Teď zrovna nemám moc velký výběr.
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{ 
		AI_Output (self ,other,"DIA_Rupert_YourOffer_03_02"); //Ten zatracenej velkostatkář už nechce dál doručovat svý zboží a to, co získáme od malých statkářů, nestačí pokrýt požadavky města ani náhodou.
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
	description = "Ukaž mi své zboží.";
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
	
	AI_Output (other,self ,"DIA_Rupert_Trade_15_00"); //Ukaž mi své zboží.
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output (self,other,"DIA_Rupert_Trade_03_01"); //Musím tě požádat o shovívavost nad mou chudou nabídkou. Člověk tvého postavení je určitě zvyklý na lepší.
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
	description = "Řekni mi o té rolnické vzpouře víc.";
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
	AI_Output (other,self ,"DIA_Rupert_Bauernaufstand_15_00"); //Řekni mi o té rolnické vzpouře víc.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_01"); //To je docela jednoduché: velkostatkář Onar už nechce dál městu odvádět daně.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_02"); //No jen si to představ! Jsme ve válce se skřety a ten tlustej lenoch chce všechno jen pro sebe!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_03"); //Normálně by v takových případech domobrana sjednala pořádek.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_04"); //Ale teď přichází to nejlepší: říká se, že Onar najal žoldáky, aby drželi vojáky z města na uzdě!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_05"); //ŽOLDÁCI! Celá tahle věc skončí nějakou zatracenou válkou! Jako kdyby JEDNA válka nestačila!
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
	description = "Co víš o Onarových žoldnéřích?";
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
	AI_Output (other,self ,"DIA_Rupert_Mercs_15_00"); //Co víš o Onarových žoldnéřích?
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_01"); //Zaslechl jsem, že většinou se jedná o bývalé vězně z hornické kolonie.
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_02"); //A jejich velitel měl údajně bejt nějaký velký zvíře z králova okolí - generál nebo co, kterýho potrestali za zradu!
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_03"); //Jsou teď strašné časy.
};



