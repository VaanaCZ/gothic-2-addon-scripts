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
	AI_Output (self ,other,"DIA_Rupert_Hello_03_01"); //Musíš mít poâádný hlad a žízeà - mohl bych ti snad ukázat své zboží?
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
	description = "Potâebuju si promluvit s paladiny...";
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
	AI_Output (other, self,"DIA_Rupert_ZuPal_15_00"); //Potâebuju si promluvit s paladiny.
	AI_Output (self ,other,"DIA_Rupert_ZuPal_03_01"); //Tak to máš jen malou nadêji. Od té doby, co paladinové zabrali horní èást mêsta, se tam jen tak nêkdo nedostane.
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
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_01"); //Já? Ne, nemám tady pâíliš velké slovo.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_02"); //V dolní èásti mêsta je jen pár lidí, kteâí mají dostateèný vliv, aby se dostali pâes stráže.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_03"); //Matteo, mùj pán, je jedním z nich. Možná by sis s ním mêl promluvit.
	
	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Jestli se mám dostat do horní ètvrti, musí mi v tom pomoci nêjací vlivní obèané z dolní èásti mêsta.");
	B_LogEntry (TOPIC_OV,"Jedním z vlivných obèanù dolní èásti mêsta je obchodník Matteo.");
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
	AI_Output (self ,other,"DIA_Rupert_WoMatteo_03_01"); //Stojíš pâímo pâed jeho krámkem. Staèí jen vejít. Je tam skoro poâád.
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Matteùv obchod leží u jižní mêstské brány. Prodává vybavení, zbranê i potraviny.");
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
	description = "A co ti ostatní vlivní mêšãané?";
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
	AI_Output (other,self ,"DIA_Rupert_WerEinfluss_15_00"); //A co ti ostatní vlivní mêšãané?
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_01"); //Obchodníci a mistr tesaâ tady na hlavní ulici jsou nejvlivnêjšími osobami ve mêstê.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_02"); //Mêl by ses pokusit o pâijetí za uèedníka u jednoho z nich - jako já.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_03"); //Od té doby, co pracuju pro Mattea, se ke mnê lidé ve mêstê chovají s úctou!
	
	B_LogEntry (TOPIC_OV,"Mêl bych vstoupit do uèení k nêkterému z místních âemeslnických mistrù.");
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
	description = "Potâebuju trochu penêz a poohlížím se po práci.";
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
	AI_Output (other,self ,"DIA_Rupert_Work_15_00"); //Potâebuju trochu penêz a poohlížím se po práci.
	AI_Output (self ,other,"DIA_Rupert_Work_03_01"); //Slyšel jsem, že má problémy se svým nástupcem. Jeho dílna je pâímo naproti.
	AI_Output (self ,other,"DIA_Rupert_Work_03_02"); //Âíká se, že platí velice slušnê.
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
	AI_Output (self ,other,"DIA_Rupert_YourOffer_03_01"); //Teë zrovna nemám moc velký výbêr.
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{ 
		AI_Output (self ,other,"DIA_Rupert_YourOffer_03_02"); //Ten zatracenej velkostatkáâ už nechce dál doruèovat svý zboží a to, co získáme od malých statkáâù, nestaèí pokrýt požadavky mêsta ani náhodou.
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
		AI_Output (self,other,"DIA_Rupert_Trade_03_01"); //Musím tê požádat o shovívavost nad mou chudou nabídkou. Èlovêk tvého postavení je urèitê zvyklý na lepší.
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
	description = "Âekni mi o té rolnické vzpouâe víc.";
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
	AI_Output (other,self ,"DIA_Rupert_Bauernaufstand_15_00"); //Âekni mi o té rolnické vzpouâe víc.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_01"); //To je docela jednoduché: velkostatkáâ Onar už nechce dál mêstu odvádêt danê.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_02"); //No jen si to pâedstav! Jsme ve válce se skâety a ten tlustej lenoch chce všechno jen pro sebe!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_03"); //Normálnê by v takových pâípadech domobrana sjednala poâádek.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_04"); //Ale teë pâichází to nejlepší: âíká se, že Onar najal žoldáky, aby drželi vojáky z mêsta na uzdê!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_05"); //ŽOLDÁCI! Celá tahle vêc skonèí nêjakou zatracenou válkou! Jako kdyby JEDNA válka nestaèila!
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
	description = "Co víš o Onarových žoldnéâích?";
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
	AI_Output (other,self ,"DIA_Rupert_Mercs_15_00"); //Co víš o Onarových žoldnéâích?
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_01"); //Zaslechl jsem, že vêtšinou se jedná o bývalé vêznê z hornické kolonie.
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_02"); //A jejich velitel mêl údajnê bejt nêjaký velký zvíâe z králova okolí - generál nebo co, kterýho potrestali za zradu!
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_03"); //Jsou teë strašné èasy.
};



