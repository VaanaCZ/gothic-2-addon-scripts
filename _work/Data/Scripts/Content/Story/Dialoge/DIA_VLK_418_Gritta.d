// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_EXIT_Condition;
	information	= DIA_Gritta_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Gritta_PICKPOCKET (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 900;
	condition	= DIA_Gritta_PICKPOCKET_Condition;
	information	= DIA_Gritta_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20_Female;
};                       

FUNC INT DIA_Gritta_PICKPOCKET_Condition()
{
	C_Beklauen (20, 20);
};
 
FUNC VOID DIA_Gritta_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gritta_PICKPOCKET);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_BACK 		,DIA_Gritta_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gritta_PICKPOCKET_DoIt);
};

func void DIA_Gritta_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
	
func void DIA_Gritta_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
INSTANCE DIA_Gritta_Hello(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 10;
	condition	= DIA_Gritta_Hello_Condition;
	information	= DIA_Gritta_Hello_Info;
	permanent	= FALSE;
	Important   = TRUE;
};                       
FUNC INT DIA_Gritta_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Gritta_Hello_16_00"); //Was willst du, Fremder? Wenn du gekommen bist, um zu betteln, muss ich dich enttäuschen, ich bin eine arme Witwe.
	AI_Output (self ,other,"DIA_Gritta_Hello_16_01"); //Mein Name ist Gritta. Seit mein Mann tot ist, kümmere ich mich um den Haushalt von meinem Onkel Thorben.
};
//*************************************************************
//			Matteo will sein Geld
//*************************************************************
INSTANCE DIA_Gritta_WantsMoney(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 2;
	condition	= DIA_Gritta_WantsMoney_Condition;
	information	= DIA_Gritta_WantsMoney_Info;
	permanent	= FALSE;
	description = "Ich komme von Matteo, du schuldest ihm noch Gold. ";
};                       
FUNC INT DIA_Gritta_WantsMoney_Condition()
{
	if (MIS_Matteo_Gold == LOG_RUNNING)
	{
		return TRUE;
	};	
};
//------------------------------------
var int Gritta_WantPay;
var int Gritta_Threatened;
//------------------------------------
FUNC VOID DIA_Gritta_WantsMoney_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_15_00"); //Ich komme von Matteo, du schuldest ihm noch Gold.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_01"); //Er will sein Geld? Wofür denn? Er hat mir fehlerhafte Ware geliefert, schlechter Stoff und schlechte Nähte.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_02"); //Hast du mal die Farben gesehen, das sind nicht die Farben, die ich bestellt habe, das ist Betrug.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_03"); //Ich sage dir, damals als mein Mann noch lebte, hätte er sich das nicht getraut. Oh, mein armer Mann ...

	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Schluss jetzt, wo ist das Geld?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Weiter...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue01 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue01_16_00"); //... was war er doch für ein guter Kerl. Gutaussehend, fleißig, ein Kavalier der alten Schule. Wir hatten alles, Vermögen, Glück ...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_01"); //... manchmal wurden wir sogar eingeladen zu der feinen Gesellschaft. Das waren Feste, all die schönen Kleider und Frisuren ...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_02"); //...das feine Essen und kultivierte Unterhaltungen. Damals war alles besser. Da hat sich niemand getraut mit so lächerlichen Forderungen das Herz einer armen Witwe ...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Schluss jetzt, wo ist das Geld?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Weiter...",DIA_Gritta_WantsMoney_Continue02);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue02 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue02_16_00"); //... zu beschämen. Was soll ich denn machen? Die Rente reicht ja kaum zum Leben und die Zeiten werden auch nicht besser. Das sieht man doch jetzt überall ...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_01"); //... die Leute müssen sparen. Es ist schon seit Wochen kein Schiff mehr in die Stadt gekommen. Mein Mann war Handelschiffkapitän, ja nicht nur Kapitän, das Schiff gehörte ihm ...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_02"); //... von seinen langen Reisen brachte er immer ein Geschenk für mich mit, kostbare Stoffe vom Festland, erlesene Gewürze aus den südlichen Ländern ...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Schluss jetzt, wo ist das Geld?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Weiter...",DIA_Gritta_WantsMoney_Continue03);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue03 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue03_16_00"); //... die meisten Leute kennen so etwas gar nicht. Doch dann eines Tages erreichte mich die Botschaft vom Untergang der Gritta, so hieß das Schiff, mein Mann hatte das Schiff aus ...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue03_16_01"); //... Liebe zu mir so genannt. Ich habe geweint und gefleht, dass mein Mann das Unglück überlebt hat, jeden Tag erhoffte ich, Nachricht von ihm zu bekommen, doch meine Sehnsucht blieb unerfüllt.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_02"); //... Innos möge seiner Seele gnädig sein. Möge er in Frieden ruhen. Seit dieser Zeit lebe ich nun in diesen bescheidenen Verhältnissen und das letzte bisschen von meinen Ersparnissen ...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_03"); //... will mir jetzt dieser Seelenverkäufer Matteo abnehmen. Hab doch Erbarmen mit einer armen Frau. Damals, als mein Mann noch lebte, hätte er sich das nicht getraut. Oh, mein armer Mann ...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Schluss jetzt, wo ist das Gold?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Weiter...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_WhereMoney ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_WhereMoney_15_00"); //Schluss jetzt, wo ist das Gold?
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01"); //(trotzig) Aber ich habe das Gold nicht, ich bin nur eine arme Witwe!
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Her mit der Kohle, sonst verpasse ich dir eine. ",DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Dann verkaufen wir halt deine Klamotten...",DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Ich werde die Summe für dich bezahlen.",DIA_Gritta_WantsMoney_IWillPay);
};
FUNC VOID DIA_Gritta_WantsMoney_EnoughStuff ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_00"); //Dann verkaufen wir halt ein paar von deinen Klamotten. Du hast doch bestimmt noch einen Haufen Zeug im Schrank ...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01"); //Untersteh dich, du Rüpel! Ist ja schon gut, hier ist das Gold.
	B_GiveInvItems (self,other,ItMi_Gold, 100); 
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_02"); //(grinst) Na also, geht doch.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03"); //(säuerlich) Verlasse jetzt bitte mein Haus.
	
	Gritta_GoldGiven = TRUE;
	
	AI_StopProcessInfos (self); 
};
func VOID DIA_Gritta_WantsMoney_IWillPay ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_00"); //Ich werde die Summe für dich bezahlen.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_01"); //Das würdest du für mich tun? Ich wusste, dass du kein raffgieriger Hund bist, wie dieser Matteo!
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_02"); //Jaja, schon gut.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_03"); //Komm wieder, wenn du das erledigt hast - ich möchte mich noch erkenntlich zeigen.
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	
	Gritta_WantPay = TRUE;
};
FUNC VOID DIA_Gritta_WantsMoney_BeatUp ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_BeatUp_15_00"); //(drohend) Her mit der Kohle, sonst verpasse ich dir eine!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_BeatUp_16_01"); //(trotzig) Du bist ein gemeiner Schläger. Los, nur zu, wenn du deine Waffe ziehst, rufe ich die Wachen!
	
	Gritta_Threatened = TRUE;
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info WINE
///////////////////////////////////////////////////////////////////////
instance DIA_Gritta_WINE		(C_INFO)
{
	npc			 = 	VLK_418_Gritta;
	nr			 = 	2;
	condition	 = 	DIA_Gritta_WINE_Condition;
	information	 = 	DIA_Gritta_WINE_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Gritta_WINE_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Gritta_WantPay == TRUE)
	&& (MIS_Matteo_Gold == LOG_SUCCESS)
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		return TRUE;
	};
};
func void DIA_Gritta_WINE_Info ()
{
	AI_Output (self, other, "DIA_Gritta_WINE_16_00"); //Dass du für mich bezahlt hast, war sehr nobel von dir. Ich möchte mich bei dir bedanken.
	AI_Output (self, other, "DIA_Gritta_WINE_16_01"); //Diese Flasche Wein hat mein Mann, Innos habe ihn selig, von den südlichen Inseln mitgebracht. Ich hoffe, du magst ihn.
	AI_Output (self, other, "DIA_Gritta_WINE_16_02"); //Außerdem werde ich das weitererzählen. Endlich ist mal jemand in der Stadt, der tugendhaft ...
	AI_Output (other, self, "DIA_Gritta_WINE_15_03"); //Ja ja, schon gut.

	B_GivePlayerXP 		(XP_PayForGritta);
	B_GiveInvItems 		(self, other, Itfo_Wine, 1);
	
	AI_StopProcessInfos (self); 
};
// *************************************************************
//							PERM (1u2)
// *************************************************************
instance DIA_Gritta_PERM (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr		 	= 3;
	condition	= DIA_Gritta_PERM_Condition;
	information	= DIA_Gritta_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};
func int DIA_Gritta_PERM_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Npc_KnowsInfo (other, DIA_Gritta_WantsMoney))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Gritta_PERM_Info ()
{
	if (Npc_KnowsInfo (other, DIA_Gritta_WINE))
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_00"); //Solange es Männer wie dich in dieser Stadt gibt, habe ich Hoffnung, dass sich alles zum Guten wenden wird.
	}
	else if (Gritta_WantPay == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_01"); //Komm wieder, wenn die Sache mit Matteo erledigt ist.
	}
	else if (Gritta_Threatened == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_02"); //Was glotzt du denn so dämlich? Du traust dich ja doch nicht, mich anzugreifen!
	}
	else //Gritta_GoldGiven oder niedergeschlagen
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_03"); //Was willst du noch? Du hast mein Gold! Geh!
	};
	
	AI_StopProcessInfos (self); 
};


//###########################################
//##
//##	Kapitel 3
//##
//###########################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_Kap3_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_Kap3_EXIT_Condition;
	information	= DIA_Gritta_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
//		Perm3U4U5
// ************************************************************

//------------------------------------
var int GrittaXP_Once;
//-----------------------------

INSTANCE DIA_Gritta_Perm3U4U5(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 31;
	condition	= DIA_Gritta_Perm3U4U5_Condition;
	information	= DIA_Gritta_Perm3U4U5_Info;
	permanent	= TRUE;
	description = "Wie geht's?";
};                       
FUNC INT DIA_Gritta_Perm3U4U5_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gritta_Perm3U4U5_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_00"); //Wie geht's?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_01"); //Hier geht doch alles vor die Hunde. Überall, wo man hinschaut, sieht man Verbrechen und Gewalt. Stell dir vor, man hat sogar einen der Paladine umgebracht.
			
			Info_ClearChoices (DIA_Gritta_Perm3U4U5);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,DIALOG_BACK,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Es ist Krieg, da passieren solche Dinge.",DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Das wird schon wieder.",DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Was hast du gehört?",DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_02"); //Ich bin ja so froh, Lord Hagen hat den Söldner freigesprochen.
			AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_03"); //Und was hast du damit zu tun?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_04"); //Denk doch mal nach. Glaubst du, die Söldner hätten zugesehen, wie einer ihrer Kameraden gehängt wird?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_05"); //Sie hätten versucht, ihn zu befreien, und dann hätte es ein großes Blutvergießen gegeben. Ich kann Innos nur danken.
		};	
	}
	else if (Kapitel == 5)	
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_06"); //Die Paladine machen sich bereit und es sieht so aus, als ob die in Kürze ausrücken.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_07"); //Wie immer, aber ich will mich nicht beklagen.
	};
};

FUNC VOID DIA_Gritta_Perm3U4U5_BACK ()
{
	Info_ClearChoices (DIA_Gritta_Perm3U4U5);
};

FUNC VOID DIA_Gritta_Perm3U4U5_War ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_War_15_00"); //Es ist Krieg, da passieren solche Dinge.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_01"); //Das kommt dazu, dieser schreckliche Krieg. Alle leiden und müssen sehen, wie sie zurecht kommen.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_02"); //Manchmal frage ich mich, was wir getan haben, dass Innos uns so straft.
};

FUNC VOID DIA_Gritta_Perm3U4U5_TurnsGood ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00"); //Das wird schon wieder.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01"); //Das ist nett, dass du mich aufmuntern möchtest.
	
	if (GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		GrittaXP_Once = TRUE;
	};	
};

FUNC VOID DIA_Gritta_Perm3U4U5_Rumors ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_Rumors_15_00"); //Was hast du gehört?
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01"); //Nur das, was man sich auf der Straße erzählt.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02"); //Angeblich hat man den Mörder schon gefasst, aber ob das stimmt, kann ich dir nicht sagen.
};












