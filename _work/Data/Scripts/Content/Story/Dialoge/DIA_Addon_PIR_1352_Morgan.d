// ************************************************************
// 			  				   EXIT 
// ************************************************************
var int Morgan_Perm_Counter;
// ------------------------------------------------------------
INSTANCE DIA_Addon_Morgan_EXIT(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 999;
	condition	= DIA_Addon_Morgan_EXIT_Condition;
	information	= DIA_Addon_Morgan_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Morgan_EXIT_Condition()
{
	return TRUE;
};
func int DIA_Addon_Morgan_EXIT_Info ()
{
	if (GregIsBack == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Morgan_Perm_15_00"); //Leg dich wieder hin.
		if (Morgan_Perm_Counter == 0)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_01"); //(gähnt) Hervorragende Idee.
			Morgan_Perm_Counter = 1;
		}
		else if (Morgan_Perm_Counter == 1)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_02"); //(verschlafen)Na dann, gute Nacht.
			Morgan_Perm_Counter = 2;
		}
		else if (Morgan_Perm_Counter == 2)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_03"); //(müde) Nichts lieber, als das.
			Morgan_Perm_Counter = 3;
		}
		else if (Morgan_Perm_Counter == 3)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_04"); //Weck mich, wenn irgendwas passiert.
			Morgan_Perm_Counter = 0;
		};
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Morgan_PICKPOCKET (C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 900;
	condition	= DIA_Addon_Morgan_PICKPOCKET_Condition;
	information	= DIA_Addon_Morgan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Morgan_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};
 
FUNC VOID DIA_Addon_Morgan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Morgan_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Morgan_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Morgan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Morgan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Morgan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Morgan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Morgan_PICKPOCKET);
};
	
func void DIA_Addon_Morgan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Morgan_PICKPOCKET);
};
// ************************************************************
// 		  				  NICHT Anheuern
// ************************************************************
instance DIA_Addon_Morgan_Anheuern(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 1;
	condition	= DIA_Addon_Morgan_Anheuern_Condition;
	information	= DIA_Addon_Morgan_Anheuern_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Morgan_Anheuern_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (GregIsBack == TRUE)
	{
		return TRUE;
	};
};
func int DIA_Addon_Morgan_Anheuern_Info ()
{
	AI_Output (self, other, "DIA_Addon_Morgan_Anheuern_07_00"); //Toll, jetzt hat Greg mich zum Brettersägen verdonnert!
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Morgan_Anheuern_07_01"); //(sarkastisch) Viel Spass beim Monster schlachten!
	};
};

// ************************************************************
// 			  				  Hallo
// ************************************************************
INSTANCE DIA_Addon_Morgan_Hello(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 1;
	condition	= DIA_Addon_Morgan_Hello_Condition;
	information	= DIA_Addon_Morgan_Hello_Info;
	permanent 	= TRUE;
	important	= TRUE;
};                      
FUNC INT DIA_Addon_Morgan_Hello_Condition()
{
	IF (MIS_AlligatorJack_BringMeat == FALSE)
	&& (Npc_IsInState (self,ZS_Talk))
	&& ((Npc_IsDead(AlligatorJack)) == FALSE)
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Morgan_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_Hello_15_00"); //Hey du!
	AI_Output (self ,other,"DIA_Addon_Morgan_Hello_07_01"); //(verschlafen) Häh? Was willst du?
	AI_Output (self ,other,"DIA_Addon_Morgan_Hello_07_02"); //(verschlafen) Ist Alligator Jack schon wieder da?
	AI_Output (self ,other,"DIA_Addon_Morgan_Hello_07_03"); //(verschlafen) Nein? Dann wird er sicher bald kommen, gute Nacht.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  		 Fleisch von Alli-Jack
// ************************************************************
INSTANCE DIA_Addon_Morgan_Meat(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 2;
	condition	= DIA_Addon_Morgan_Meat_Condition;
	information	= DIA_Addon_Morgan_Meat_Info;

	description	= "Ich habe hier eine Lieferung Fleisch.";
};                       
FUNC INT DIA_Addon_Morgan_Meat_Condition()
{
	IF (MIS_AlligatorJack_BringMeat == LOG_RUNNING)
	&& (Npc_HasItems (other,ItFoMuttonRaw) >= 1)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Morgan_Meat_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_Meat_15_00"); //Ich habe hier eine Lieferung Fleisch.

	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_01"); //(wird wach) Puh. Ich brauch erst mal einen Schluck zum Wachwerden.
		
		CreateInvItems (self, ItFo_Booze, 3);									
		B_UseItem (self,ItFo_Booze);
		
		AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_02"); //So, besser. Also nochmal, was willst du?
		AI_Output (other,self ,"DIA_Addon_Morgan_Meat_15_03"); //Ich bringe eine Lieferung Fleisch. Von Alligator Jack.
	};

	AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_04"); //Ich erinnere mich. Genau! Das Fleisch, gib her!
	
	var int GivenMeat; GivenMeat = Npc_HasItems (other, ItFoMuttonRaw);
	
	if (GivenMeat > 10)
	{
		GivenMeat = 10;
	};
	
	B_GiveInvItems (other,self,ItFoMuttonRaw, GivenMeat);
	
	if (GivenMeat < 10)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_05"); //Was, das ist alles? Hast den Rest Rest selber gefreesen was? Naja, egal...
	};
	
	B_LogEntry (TOPIC_Addon_BringMeat,"Ich habe Morgan sein Fleisch gebracht.");
	
	MIS_AlligatorJack_BringMeat = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_ALLIGatORJACK_BringMeat);
};

// ************************************************************
// 			 				Hallo 2 (Job)
// ************************************************************
INSTANCE DIA_Addon_Morgan_Job(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 3;
	condition	= DIA_Addon_Morgan_Job_Condition;
	information	= DIA_Addon_Morgan_Job_Info;

	description	= "Was machst du hier?";
};                       
FUNC INT DIA_Addon_Morgan_Job_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Morgan_Meat))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Morgan_Job_Info()
{	
	AI_Output (other, self, "DIA_Addon_Morgan_Job_15_01"); //Was machst du hier?
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_01"); //Greg hat mir das Kommando über einen der beiden Entertrupps gegeben.
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_02"); //Ich bin für die Versorgung des Lagers zuständig - darum kümmert sich Alligator Jack.
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_03"); //Außerdem bin ich dafür verantwortlich, dass die Biester hier in der Gegend nicht zu nah ans Lager kommen.
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_04"); //Darum kümmern sich die JUNGS.
	if (GregIsBack == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Morgan_Job_07_05"); //Ich hab ihnen gesagt, ich will hier kein einziges Vieh mehr in der Nähe sehen, (gähnt) wenn Greg zurückkommt.
	};
};

// ************************************************************
// 			 			Faule Sau --> Lehrer		  
// ************************************************************
INSTANCE DIA_Addon_Morgan_Sleep(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 4;
	condition	= DIA_Addon_Morgan_Sleep_Condition;
	information	= DIA_Addon_Morgan_Sleep_Info;

	description	= "Tust du auch mal was?";
};                       
FUNC INT DIA_Addon_Morgan_Sleep_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Morgan_Job))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Morgan_Sleep_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_Sleep_15_00"); //Tust du auch mal was?
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_01"); //Hey, nicht frech werden!
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_02"); //Ich habe die wichtigste Aufgabe von allen.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_03"); //Ich kümmere mich um die Ausbildung meiner Leute.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_04"); //Ich mache sie zu den besten und furchtlosesten Kämpfern, die jemals auf diesen Gewässern gekreuzt sind.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_05"); //Außerdem ist es ja nicht so, daß die Jungs nichts davon haben, ihre Arbeit zu machen.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_06"); //Sie bekommen 'nen ordentlichen Sack voll Gold dafür.
};

// ************************************************************
// ***														***
// 							Entertrupp
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 						Ich will mitmachen!
// ------------------------------------------------------------
instance DIA_Addon_Morgan_JoinMorgan(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 5;
	condition	= DIA_Addon_Morgan_JoinMorgan_Condition;
	information	= DIA_Addon_Morgan_JoinMorgan_Info;

	description	= "Ich will in deinen Trupp.";
};                       
FUNC INT DIA_Addon_Morgan_JoinMorgan_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Morgan_Sleep))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Morgan_JoinMorgan_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_JoinMorgan_15_00"); //Ich will in deinen Trupp.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_01"); //(lacht) Mein Trupp? Mein Trupp hängt am Strand rum.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_03"); //Die Jungs machen keinen Finger krumm, bis der Käpt'n wieder da ist, das kann ich dir versprechen.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_04"); //Aber wenn du allen zeigen willst, was du drauf hast, kannst du dir ja mal den Strand im Norden vornehmen.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_05"); //Der ist voller Lurker und was weiß ich noch allem.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_06"); //Zieh die Sache alleine durch und du verdienst dir den Respekt (gähnt) der Leute...
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_07"); //Willommen in meinem Trupp. Ha! Ich hau mich wieder hin...
	
	Log_CreateTopic (TOPIC_Addon_MorganBeach,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_MorganBeach,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MorganBeach,"Jetzt da ich in Morgans Entertrupp bin, will er, dass ich den nördlichen Strand von Viechern säubere.");
	
	MIS_Addon_MorganLurker = LOG_RUNNING;
	AI_StopProcessInfos (self);
};

// ------------------------------------------------------------
// 							LurkerPlatt
// ------------------------------------------------------------
instance DIA_Addon_Morgan_LurkerPlatt		(C_INFO)
{
	npc		 	= PIR_1353_Addon_Morgan;
	nr		 	= 6;
	condition	= DIA_Addon_Morgan_LurkerPlatt_Condition;
	information	= DIA_Addon_Morgan_LurkerPlatt_Info;
	permanent	= TRUE;
	description	= "Der Strand im Norden ist sauber.";
};
func int DIA_Addon_Morgan_LurkerPlatt_Condition ()
{
	if (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (MIS_Addon_MorganLurker == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Morgan_LurkerPlatt_Info ()
{
	AI_Output (other, self, "DIA_Addon_Morgan_LurkerPlatt_15_00"); //Der Strand im Norden ist sauber.
	AI_Output (self, other, "DIA_Addon_Morgan_LurkerPlatt_07_01"); //Was ist mit der Höhle? Warst du da auch schon?
		
	if (Npc_IsDead(BeachShadowbeast1))
	{
		AI_Output	(other, self, "DIA_Addon_Morgan_LurkerPlatt_15_02"); //Klar.
		AI_Output	(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_03"); //Sauber. Bist ein guter Mann.
		AI_Output	(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_04"); //Hier hast du deinen Lohn.
		CreateInvItems (self, ItMi_Gold, 150);									
		B_GiveInvItems (self, other, ItMi_Gold, 150);
		
		B_LogEntry (TOPIC_Addon_MorganBeach,"Der Strand ist sauber. Ich habe alle Biester erledigt.");
		
		MIS_Addon_MorganLurker = LOG_SUCCESS;
				
		B_GivePlayerXP (XP_Addon_Morgan_LurkerPlatt);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Morgan_LurkerPlatt_15_05"); //Äh ...
		AI_Output	(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_06"); //Die gehört natürlich auch dazu. Komm wieder, wenn du das erledigt hast.
		
		B_LogEntry (TOPIC_Addon_MorganBeach,"Morgan will, dass ich mich auch noch um die Höhle kümmere.");
		
		AI_StopProcessInfos (self);
	};
};

// ------------------------------------------------------------
//						Sonst noch Auftrag?
// ------------------------------------------------------------
instance DIA_Addon_Morgan_Auftrag2		(C_INFO)
{
	npc		 	= PIR_1353_Addon_Morgan;
	nr		 	= 99;
	condition	= DIA_Addon_Morgan_Auftrag2_Condition;
	information	= DIA_Addon_Morgan_Auftrag2_Info;
	permanent	= TRUE;
	description	= "Gibt's sonst noch was zu tun für mich?";
};
func int DIA_Addon_Morgan_Auftrag2_Condition ()
{
	if (MIS_Addon_MorganLurker == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Addon_Morgan_Auftrag2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Morgan_Auftrag2_15_00"); //Gibt's sonst noch was zu tun für mich?

	if (GregIsBack == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_01"); //Im Moment nicht.
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_02"); //Such dir erst mal 'ne Koje und trink dir 'ne ordentliche Buddel Rum!
		CreateInvItems (self, ItFo_Booze, 3);									
		B_UseItem (self,ItFo_Booze);
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_03"); //Aaah. Das Zeug ist gut.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_04"); //Da fragst du am besten den Käpt'n.
	};
	
	AI_StopProcessInfos (self);
};



//**************************************************
//				Angus und Hank (Ring)
//**************************************************
var int Morgan_AngusStory;
//--------------------------------------------------
instance DIA_Addon_Morgan_FOUNDTHEM(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 7;
	condition	= DIA_Addon_Morgan_FOUNDTHEM_Condition;
	information	= DIA_Addon_Morgan_FOUNDTHEM_Info;
	permanent	= TRUE;
	description	= "Wegen Angus und Hank...";
};                       
FUNC INT DIA_Addon_Morgan_FOUNDTHEM_Condition()
{
	if (MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_AngusHank))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Morgan_FOUNDTHEM_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_15_00"); //Wegen Angus und Hank ...
	
	if (Morgan_AngusStory == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_01"); //Hör bloß auf mit DER Sache.
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_02"); //Die beiden haben sich wahrscheinlich von Banditen umbringen lassen.
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_03"); //Und Angus hatte meinen Ring dabei.
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_04"); //Na gut, eigentlich war es SEIN Ring. Er hat ihn beim Würfeln gewonnen.
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_05"); //Aber ich hätte ihn mir wieder zurückgeholt und jetzt ist er WEG!
		Morgan_AngusStory = TRUE;
	};

	Info_ClearChoices (DIA_Addon_Morgan_FOUNDTHEM);
	if (Npc_HasItems (other, ItRi_Addon_MorgansRing_Mission) > 0)
	{
		Info_AddChoice (DIA_Addon_Morgan_FOUNDTHEM, "Ich habe sie gefunden.", DIA_Addon_Morgan_FOUNDTHEM_Now);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_06"); //Wenn du meinen Ring findest, dann bring ihn zu mir zurück. Du sollst es auch nicht umsonst gemacht haben!
	};
};
func void DIA_Addon_Morgan_FOUNDTHEM_Now()
{
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_15_01"); //Ich habe sie gefunden.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_07"); //Jetzt lass dir doch nicht jedes Wort aus der Nase ziehen. Wo sind sie?
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_15_03"); //Sie sind tot.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_08"); //Der Ring, was ist mit dem Ring?
	Info_ClearChoices (DIA_Addon_Morgan_FOUNDTHEM);
	Info_AddChoice (DIA_Addon_Morgan_FOUNDTHEM,"Hier ist er.",DIA_Addon_Morgan_FOUNDTHEM_GiveRing);
	Info_AddChoice (DIA_Addon_Morgan_FOUNDTHEM,"Den hatten sie nicht dabei.",DIA_Addon_Morgan_FOUNDTHEM_NoRing);
};
func void DIA_Addon_Morgan_FOUNDTHEM_NoRing()
{
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_15_00"); //Den hatten sie nicht dabei.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_01"); //entsetzt) Was? Geh zurück und suche noch mal. Sie müssen ihn dabei gehabt haben.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_02"); //Es ist ein kleiner Ring mit vielen kleinen Verzierungen.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_03"); //Du MUSST ihn finden. Du MUSST!
	Info_ClearChoices (DIA_Addon_Morgan_FOUNDTHEM);
};
func void DIA_Addon_Morgan_FOUNDTHEM_GiveRing()
{
	AI_Output (other, self ,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_15_00"); //Hier ist er.
	B_GiveInvItems (other, self ,ItRi_Addon_MorgansRing_Mission,1);
	AI_Output (self, other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_01"); //(freut sich wie ein Kind) Ja, das ist er. Guter Mann!
	AI_Output (self, other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_02"); //Hier, nimm diese Steintafel. Sie sieht zwar aus wie alter Ramsch, aber Garett wird 'ne Menge Gold dafür springen lassen.
	
	MIS_Addon_Morgan_SeekTraitor = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_MorgansRing);
	Info_ClearChoices (DIA_Addon_Morgan_FOUNDTHEM);
	
	//PATCH M.F.
	B_GiveInvItems (self, other, ItWr_StonePlateCommon_Addon,1);
};



//**************************************************
//			Francis
//**************************************************

INSTANCE DIA_Addon_Morgan_Francis(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 5;
	condition	= DIA_Addon_Morgan_Francis_Condition;
	information	= DIA_Addon_Morgan_Francis_Info;

	description	= "Was hälst du von Francis?";
};                       
FUNC INT DIA_Addon_Morgan_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};

FUNC VOID DIA_Addon_Morgan_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_Francis_15_00"); //Was hältst du von Francis?
	AI_Output (self ,other,"DIA_Addon_Morgan_Francis_07_01"); //Der ist mir egal, (gefährlich) solange er mich in Ruhe lässt!
	AI_Output (other,self ,"DIA_Addon_Morgan_Francis_15_02"); //Ist er nicht der Boss hier?
	AI_Output (self ,other,"DIA_Addon_Morgan_Francis_07_03"); //(lacht dreckig) Er HÄLT sich für den Boss.
	AI_Output (self ,other,"DIA_Addon_Morgan_Francis_07_04"); //(schadenfroh) Aber irgendwann ist Greg wieder da, und dann wird Francis wieder schön - brav - Bretter sägen.
};


// ************************************************************
// ***														***
//							TEACH
// ***														***
// ************************************************************

// ------------------------------------------------------------
// 							Wanna Learn  
// ------------------------------------------------------------
INSTANCE DIA_Addon_Morgan_TRAIN(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 5;
	condition	= DIA_Addon_Morgan_TRAIN_Condition;
	information	= DIA_Addon_Morgan_TRAIN_Info;

	description	= "Kannst du mich auch trainieren?";
};                       
FUNC INT DIA_Addon_Morgan_TRAIN_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Morgan_Sleep))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Morgan_TRAIN_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_TRAIN_15_00"); //Kannst du mich AUCH trainieren?
	AI_Output (self ,other,"DIA_Addon_Morgan_TRAIN_07_01"); //Klar, ich kann ich dir zeigen, wie man mit Einhandwaffen kämpft.
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);
	
	Morgan_Addon_TeachPlayer = TRUE;
};

// ------------------------------------------------------------
// 		  		Unterrichte mich!
// ------------------------------------------------------------
var int Morgan_merke1h;
var int Morgan_Labercount;
// ------------------------------------------------------------
instance DIA_Addon_Morgan_Teach(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 99;
	condition	= DIA_Addon_Morgan_Teach_Condition;
	information	= DIA_Addon_Morgan_Teach_Info;
	permanent	= TRUE;
	description	= "Unterrichte mich!";
};                       
FUNC INT DIA_Addon_Morgan_Teach_Condition()
{
	if (Morgan_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Morgan_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_Teach_15_00"); //Unterrichte mich!
	
	Morgan_merke1h = other.HitChance[NPC_TALENT_1H];  
	
	Info_ClearChoices 	(DIA_Addon_Morgan_Teach);
	Info_AddChoice 		(DIA_Addon_Morgan_Teach, DIALOG_BACK		,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)			,DIA_Addon_Morgan_Teach_1H_5);
};
func VOID DIA_Addon_Morgan_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_1H] > Morgan_Merke1h)
	{
		if (Morgan_Labercount == 0)
		{
			AI_Output (self,other,"DIA_Addon_Morgan_CommentFightSkill_07_00"); //Und denk dran, an diesem Geschwätz von Ehre ist nichts dran. Entweder du tötest ihn, oder er tötet dich.
			Morgan_Labercount = 1;	
		}
		else if (Morgan_Labercount == 1)
		{
			AI_Output (self,other,"DIA_Addon_Morgan_CommentFightSkill_07_01"); //In Zukunft musst du noch lernen mehr Kraft in deine Schläge zu legen.
			Morgan_Labercount = 2;	
		}
		else if (Morgan_Labercount == 2)
		{
			AI_Output (self,other,"DIA_Addon_Morgan_CommentFightSkill_07_02"); //Hahaha, zumindest weisst du mittlerweile, wie man ein Schwert hält.
			Morgan_Labercount = 0;	
		};
	}
	else if (other.HitChance[NPC_TALENT_1H] >= 75)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_Teach_Back_07_00"); //Wenn du noch besser werden willst, dann musst du dir 'nen Anderen suchen.
	};
	Info_ClearChoices (DIA_Addon_Morgan_Teach);
};
func VOID DIA_Addon_Morgan_Teach_1H_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 75);
			
	Info_ClearChoices 	(DIA_Addon_Morgan_Teach);
	Info_AddChoice 		(DIA_Addon_Morgan_Teach,	DIALOG_BACK		,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)			,DIA_Addon_Morgan_Teach_1H_5);
};

FUNC VOID DIA_Addon_Morgan_Teach_1H_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 75);

	Info_ClearChoices 	(DIA_Addon_Morgan_Teach);
	Info_AddChoice 		(DIA_Addon_Morgan_Teach,	DIALOG_BACK		,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)			,DIA_Addon_Morgan_Teach_1H_5);
};



















