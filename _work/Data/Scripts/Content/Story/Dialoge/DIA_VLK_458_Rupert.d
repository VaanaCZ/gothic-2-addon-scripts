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
	AI_Output (self ,other,"DIA_Rupert_Hello_03_00"); //Haló, cizinèe!
	AI_Output (self ,other,"DIA_Rupert_Hello_03_01"); //Musíš mít poøádný hlad a žízeò - mohl bych ti snad ukázat své zboží?
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
	description = "Potøebuju si promluvit s paladiny...";
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
	AI_Output (other, self,"DIA_Rupert_ZuPal_15_00"); //Potøebuju si promluvit s paladiny.
	AI_Output (self ,other,"DIA_Rupert_ZuPal_03_01"); //Tak to máš jen malou nadìji. Od té doby, co paladinové zabrali horní èást mìsta, se tam jen tak nìkdo nedostane.
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
	description = "Mùžeš mi pomoci proniknout do horní ètvrti?";
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
	AI_Output (other, self,"DIA_Rupert_HelpMeIntoOV_15_00"); //Mùžeš mi pomoci proniknout do horní ètvrti?
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_01"); //Já? Ne, nemám tady pøíliš velké slovo.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_02"); //V dolní èásti mìsta je jen pár lidí, kteøí mají dostateèný vliv, aby se dostali pøes stráže.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_03"); //Matteo, mùj pán, je jedním z nich. Možná by sis s ním mìl promluvit.
	
	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Jestli se mám dostat do horní ètvrti, musí mi v tom pomoci nìjací vlivní obèané z dolní èásti mìsta.");
	B_LogEntry (TOPIC_OV,"Jedním z vlivných obèanù dolní èásti mìsta je obchodník Matteo.");
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
	AI_Output (self ,other,"DIA_Rupert_WoMatteo_03_01"); //Stojíš pøímo pøed jeho krámkem. Staèí jen vejít. Je tam skoro poøád.
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Matteùv obchod leží u jižní mìstské brány. Prodává vybavení, zbranì i potraviny.");
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
	description = "A co ti ostatní vlivní mìšané?";
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
	AI_Output (other,self ,"DIA_Rupert_WerEinfluss_15_00"); //A co ti ostatní vlivní mìšané?
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_01"); //Obchodníci a mistr tesaø tady na hlavní ulici jsou nejvlivnìjšími osobami ve mìstì.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_02"); //Mìl by ses pokusit o pøijetí za uèedníka u jednoho z nich - jako já.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_03"); //Od té doby, co pracuju pro Mattea, se ke mnì lidé ve mìstì chovají s úctou!
	
	B_LogEntry (TOPIC_OV,"Mìl bych vstoupit do uèení k nìkterému z místních øemeslnických mistrù.");
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
	description = "Potøebuju trochu penìz a poohlížím se po práci.";
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
	AI_Output (other,self ,"DIA_Rupert_Work_15_00"); //Potøebuju trochu penìz a poohlížím se po práci.
	AI_Output (self ,other,"DIA_Rupert_Work_03_01"); //Slyšel jsem, že má problémy se svým nástupcem. Jeho dílna je pøímo naproti.
	AI_Output (self ,other,"DIA_Rupert_Work_03_02"); //Øíká se, že platí velice slušnì.
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
	description = "Co mi mùžeš nabídnout?";
};                      
FUNC INT DIA_Rupert_YourOffer_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Rupert_YourOffer_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_YourOffer_15_00"); //Co máš na prodej?
	AI_Output (self ,other,"DIA_Rupert_YourOffer_03_01"); //Teï zrovna nemám moc velký výbìr.
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{ 
		AI_Output (self ,other,"DIA_Rupert_YourOffer_03_02"); //Ten zatracenej velkostatkáø už nechce dál doruèovat svý zboží a to, co získáme od malých statkáøù, nestaèí pokrýt požadavky mìsta ani náhodou.
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
		AI_Output (self,other,"DIA_Rupert_Trade_03_01"); //Musím tì požádat o shovívavost nad mou chudou nabídkou. Èlovìk tvého postavení je urèitì zvyklý na lepší.
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
	description = "Øekni mi o té rolnické vzpouøe víc.";
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
	AI_Output (other,self ,"DIA_Rupert_Bauernaufstand_15_00"); //Øekni mi o té rolnické vzpouøe víc.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_01"); //To je docela jednoduché: velkostatkáø Onar už nechce dál mìstu odvádìt danì.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_02"); //No jen si to pøedstav! Jsme ve válce se skøety a ten tlustej lenoch chce všechno jen pro sebe!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_03"); //Normálnì by v takových pøípadech domobrana sjednala poøádek.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_04"); //Ale teï pøichází to nejlepší: øíká se, že Onar najal žoldáky, aby drželi vojáky z mìsta na uzdì!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_05"); //ŽOLDÁCI! Celá tahle vìc skonèí nìjakou zatracenou válkou! Jako kdyby JEDNA válka nestaèila!
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
	description = "Co víš o Onarových žoldnéøích?";
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
	AI_Output (other,self ,"DIA_Rupert_Mercs_15_00"); //Co víš o Onarových žoldnéøích?
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_01"); //Zaslechl jsem, že vìtšinou se jedná o bývalé vìznì z hornické kolonie.
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_02"); //A jejich velitel mìl údajnì bejt nìjaký velký zvíøe z králova okolí - generál nebo co, kterýho potrestali za zradu!
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_03"); //Jsou teï strašné èasy.
};



