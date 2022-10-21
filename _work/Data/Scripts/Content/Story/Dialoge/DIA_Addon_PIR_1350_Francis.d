// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Francis_EXIT(C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 999;
	condition	= DIA_Addon_Francis_EXIT_Condition;
	information	= DIA_Addon_Francis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Francis_EXIT_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Francis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			In Gregs H�tte rein 
// ************************************************************
// ------------------------------------------------------------
// 			  		Spieler kennt H�tte nicht
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_First (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 1;
	condition	= DIA_Addon_Francis_First_Condition;
	information	= DIA_Addon_Francis_First_Info;
	permanent	= FALSE;
	description = "Ist das deine H�tte?";
};                       
FUNC INT DIA_Addon_Francis_First_Condition()
{
	if (Knows_GregsHut == FALSE)
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_First_Info()
{	
	AI_Output (other,self,"DIA_Addon_Francis_GregsHut_15_00"); //Ist das deine H�tte?
	AI_Output (self,other,"DIA_Addon_Francis_GregsHut_13_01"); //Nein, sie geh�rt Greg.
	Knows_GregsHut = TRUE;
};
// ------------------------------------------------------------
// 			  			Ich mu� da rein!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_LetMeIn (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 2;
	condition	= DIA_Addon_Francis_LetMeIn_Condition;
	information	= DIA_Addon_Francis_LetMeIn_Info;
	permanent	= FALSE;
	description = "Ich muss in Gregs H�tte.";
};                       
FUNC INT DIA_Addon_Francis_LetMeIn_Condition()
{
	if ( (Npc_KnowsInfo (other, DIA_Addon_Francis_First)) || (Knows_GregsHut == TRUE) )
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_LetMeIn_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_LetMeIn_15_00"); //Ich muss in Gregs H�tte.
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_01"); //Vergi� es!
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_02"); //Greg ist nicht da. Und ich hab' die T�r verschlossen und passe auf, dass niemand auf dumme Gedanken kommt und versucht, die H�tte zu pl�ndern. 
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_03"); //Also schipper wieder ab, oder ich mach dir Beine!
};
// ------------------------------------------------------------
// 			  			Hab Greg getroffen!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AboutGreg (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 3;
	condition	= DIA_Addon_Francis_AboutGreg_Condition;
	information	= DIA_Addon_Francis_AboutGreg_Info;
	permanent	= FALSE;
	description = "Greg ist dein Boss?";
};                       
FUNC INT DIA_Addon_Francis_AboutGreg_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Francis_ausgeschissen == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AboutGreg_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_AboutGreg_15_00"); //Greg ist dein Boss?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_01"); //Jetzt komm mir blo� nicht damit, da� du ihn kennst!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_02"); //Jeder Seefahrer, ach, was sag ich, jede verfluchte Landratte auf der Insel kennt den schrecklichen K�pt'n Greg!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_03"); //(schn�selig) Er hat MIR das Kommando �bergeben!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_04"); //Ich bin ihm daf�r verantwortlich, da� das faule Pack hier das macht, was er angeordnet hat!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_05"); //Einige von den Jungs hier denken vielleicht, sie k�nnen machen was sie wollen, nur weil der K�pt'n nicht da ist.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_06"); //Aber DIE werden sich noch wundern, wenn Greg zur�ckkommt. 
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_07"); //Ich werde ihm alles erz�hlen, was hier vorgefallen ist, h�rst du?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_08"); //Auch, wer versucht hat in seine H�tte zu kommen.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_09"); //Also zieh Leine, oder du bekommst den �rger deines Lebens.
};
// ------------------------------------------------------------
// 		  			Gib mir Schl�ssel + Bestechung!
// ------------------------------------------------------------
var int Francis_bezahlt;

INSTANCE DIA_Addon_Francis_Key (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 4;
	condition	= DIA_Addon_Francis_Key_Condition;
	information	= DIA_Addon_Francis_Key_Info;
	permanent	= TRUE;
	description = "Gib mir den Schl�ssel zu Gregs H�tte!";
};                       
FUNC INT DIA_Addon_Francis_Key_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Key_Info()
{	
	AI_Output (other, self,"DIA_Addon_Francis_Key_15_00"); //Gib mir den Schl�ssel zu Gregs H�tte!
	AI_Output (self ,other,"DIA_Addon_Francis_Key_13_01"); //Du machst wohl Witze!
	
	Info_ClearChoices (DIA_Addon_Francis_Key);
	Info_AddChoice (DIA_Addon_Francis_Key, "Ich denk nochmal dr�ber nach...", DIA_Addon_Francis_Key_BACK);
	Info_AddChoice (DIA_Addon_Francis_Key, "Ich gebe dir 2000 Goldst�cke!", DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice (DIA_Addon_Francis_Key, "Ich gebe dir 1000 Goldst�cke!", DIA_Addon_Francis_Key_1000Gold);
};
func void DIA_Addon_Francis_Key_BACK()
{
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output (other, self ,"DIA_Addon_Francis_Key_1000Gold_15_00"); //Ich gebe dir 1000 Goldst�cke!
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_01"); //F�r den Verrat an meinen Kapit�n ist das ein bisschen wenig. Findest du nicht?
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_02"); //Du solltest aufpassen, was du sagst! Sonst zieh ich dir das Fell �ber die Ohren!
};
func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output (other,self ,"DIA_Addon_Francis_Key_2000Gold_15_00"); //Ich gebe dir 2000 Goldst�cke!
	
	if (Npc_HasItems (other,ItMI_Gold) >= 2000)
	{
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_01"); //Junge, was du verlangst, ist Meuterei!
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_02"); //(zu sich) Aber, wenn ich es mir so recht �berlege...
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_03"); //Ach, gib schon her. Muss ja keiner erfahren.
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_04"); //Hier hast du den Schl�ssel!
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_05"); //Aber mach schnell, bevor Greg wiederkommt! Und kein Wort zu den anderen, klar?!
		B_GiveInvItems (other, self,ItMi_Gold,2000);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
		Francis_bezahlt = TRUE;
	}
	else 
	{
		AI_Output (self ,other,"DIA_Addon_FrancisNotEnoughGold_13_05"); //(lacht) Ha! Soviel hast du doch gar nicht!
	};
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
// ------------------------------------------------------------
// 			  				Aufs Maul!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AufsMaul (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_AufsMaul_Condition;
	information	= DIA_Addon_Francis_AufsMaul_Info;
	permanent	= TRUE;
	description = "Na, dann lass mal sehen, was du drauf hast.";
};                       
FUNC INT DIA_Addon_Francis_AufsMaul_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AufsMaul_Info()
{	
	AI_Output (other, self, "DIA_Addon_Francis_AufsMaul_15_00"); //Na, dann lass mal sehen, was du drauf hast.
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_01"); //(schrill) Was? Ich bin hier der K�pt'n! 
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_02"); //Ich werde dir Respekt beibringen, du Landratte!
	
	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);
};
// ------------------------------------------------------------
// 			  		Ich habe dein Versteck gefunden...
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_Buch (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_Buch_Condition;
	information	= DIA_Addon_Francis_Buch_Info;
	permanent	= TRUE;
	description = "Ich habe dein Versteck gefunden...";
};                       
FUNC INT DIA_Addon_Francis_Buch_Condition()
{
	if (Npc_HasItems (other, ITWR_Addon_FrancisAbrechnung_Mis))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Buch_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_03"); //Ich habe dein Versteck gefunden. Deinen Schatz und ein Heuerbuch. Das ist doch dein Buch, oder?
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_01"); //�h... Das Buch hab ich noch nie gesehen...
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_02"); //Und.. �h... Und selbst WENN mir das Buch geh�ren w�rde...
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_03"); //Du glaubst doch nicht im ERNST, da� die Jungs DIR die Geschichte nur wegen ein paar vergilbter Zetteln abkaufen, oder?
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_01"); //Du hast sie alle um ihren Anteil betrogen.
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_04"); //�h... Warte mal...
	if (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_05"); //(schleimig) Du wolltest doch den Schl�ssel zu Gregs H�tte...
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_06"); //Ich GEBE dir den Schl�ssel zu Gregs H�tte!
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_07"); //Da drinnen sind 'ne Menge wertvolle Sachen...
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_08"); //(nerv�s) Aber du gibst mir das Buch und h�lst die Schnauze, klar?
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_09"); //Mach blo� keinen Schei�!
		if (Francis_bezahlt == TRUE)
		&& (Npc_HasItems(self, itmi_gold) >= 2000)
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_10"); //Hier sind deine 2000 Goldst�cke!
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_11"); //Und ich leg noch 500 drauf
			B_GiveInvItems (self, other, itmi_gold, 2500);
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_12"); //Hier sind 500 Goldst�cke!
			B_GiveInvItems (self, other, itmi_gold, 500);
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_13"); //(hastig) Und jetzt gib mir das Ding...
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
	};
	AI_StopProcessInfos (self);
};

// ------------------------------------------------------------
// 			  				PICK POCKET
// ------------------------------------------------------------
instance DIA_Francis_PICKPOCKET (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_PICKPOCKET_Condition;
	information	= DIA_Francis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es w�re einfach seinen Schl�ssel zu stehlen)";
};                       
func INT DIA_Francis_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Francis_PICKPOCKET);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_BACK 		,DIA_Francis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Francis_PICKPOCKET_DoIt);
};
func void DIA_Francis_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self,other , ITKE_Greg_ADDON_MIS, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Francis_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //AR_Theft f�hrt zu NEWS!
	};
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};
func void DIA_Francis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};


// ************************************************************
// 			  		Wenn von Greg weggeschickt 
// ************************************************************
instance DIA_Francis_Ausgeschissen (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_Ausgeschissen_Condition;
	information	= DIA_Francis_Ausgeschissen_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       
func INT DIA_Francis_Ausgeschissen_Condition()
{
	if (Francis_ausgeschissen == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_Ausgeschissen_Info()
{	
	if (!Npc_IsDead(Greg))
	{
		AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_00"); //(w�tend) Wegen dir l��t mich Greg jetzt hier Bretter s�gen, bis es auf der ganzen Insel kein Holz mehr gibt!
	};
	AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_01"); //Lass mich blo� in Ruhe!
	AI_StopProcessInfos (self);
};


