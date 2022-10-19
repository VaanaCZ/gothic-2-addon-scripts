//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_EXIT   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 999;
	condition   = DIA_Jesper_EXIT_Condition;
	information = DIA_Jesper_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Jesper_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Jesper_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jesper_PICKPOCKET (C_INFO)
{
	npc			= VLK_446_Jesper;
	nr			= 900;
	condition	= DIA_Jesper_PICKPOCKET_Condition;
	information	= DIA_Jesper_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Jesper_PICKPOCKET_Condition()
{
	C_Beklauen (80, 180);
};
 
FUNC VOID DIA_Jesper_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jesper_PICKPOCKET);
	Info_AddChoice		(DIA_Jesper_PICKPOCKET, DIALOG_BACK 		,DIA_Jesper_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jesper_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jesper_PICKPOCKET_DoIt);
};

func void DIA_Jesper_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jesper_PICKPOCKET);
};
	
func void DIA_Jesper_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jesper_PICKPOCKET);
};
//////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Hallo   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 1;
	condition   = DIA_Jesper_Hallo_Condition;
	information = DIA_Jesper_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Jesper_Hallo_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Jesper_Hallo_Info()
{
	AI_Output (self, other,"DIA_Jesper_Hallo_09_00");//Hey, was machst du hier unten? Du hast hier nichts zu suchen.
	AI_Output (self, other,"DIA_Jesper_Hallo_09_01");//Also, raus mit der Sprache, was willst du hier?
		
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Ich bin gekommen, um dich zu töten.",DIA_Jesper_Hallo_Kill);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Ich wollte mal gucken was hier so los ist.",DIA_Jesper_Hallo_NurSo);
		
	if  (Attila_Key == TRUE)
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Attila hat mir einen Schlüssel gegeben...",DIA_Jesper_Hallo_Willkommen);
	}	
	else 
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Ich hab Attila umgelegt,...",DIA_Jesper_Hallo_Umgelegt);
	};
	
	DG_gefunden = TRUE;
	
};
FUNC VOID DIA_Jesper_Hallo_Kill()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Kill_15_00");//Ich bin gekommen, um dich zu töten.
	AI_Output (self, other,"DIA_Jesper_Hallo_Kill_09_01");//Das ist ja 'ne Spitzenidee. Haste dir alleine ausgedacht, was? Ach was soll's. Ich mache es kurz.
	
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Jesper_Hallo_NurSo()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_NurSo_15_00");//Ich wollte mal gucken, was hier so los ist.
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_01");//Hier gibt's aber nichts zu gucken. Du bewegst dich auf gefährlichem Gebiet, klar?
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_02");//Also lass deine Waffe stecken und sag mir, warum du hergekommen bist.
};
FUNC VOID DIA_Jesper_Hallo_Willkommen()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Willkommen_15_00");//Attila hat mir einen Schlüssel gegeben. Deshalb bin ich hier. Also, was wollt ihr von mir?
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_01");//Willste wohl wissen, was? Immer ruhig bleiben.
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_02");//Geh mal zu Cassia. Wirst schon erwartet.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID DIA_Jesper_Hallo_Umgelegt()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Umgelegt_15_00");//Ich hab Attila umgelegt, der hatte den Schlüssel zur Kanalisation dabei.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_01");//(ungläubig) DU hast Attila getötet?! (verächtlich) Was soll's, er war eh ein mieser Hund.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_02");//Aber ich sag dir was. Wenn du dich mit mir anlegst, dann werde ich dich töten.
	
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Was machst du hier,...",DIA_Jesper_Hallo_Was);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Bring mich zu deinem Anführer. ",DIA_Jesper_Hallo_Anfuehrer);
};
FUNC VOID DIA_Jesper_Hallo_Was()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Was_15_00");//Was machst du hier, in diesem dunklen, nassen Loch?
	AI_Output (self, other,"DIA_Jesper_Hallo_Was_09_01");//(knurrt) Ich wohn hier. Noch so 'ne dumme Frage und ich schneide ein Muster ins Fleisch.
};
FUNC VOID DIA_Jesper_Hallo_Anfuehrer()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Anfuehrer_15_00");//Bring mich zu deinem Anführer.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_01");//(lacht dreckig) HA - mein Anführer? Ich bin sicher, dass Cassia mit dir sprechen will.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_02");//Los geh weiter - und versuch nicht, mich reinzulegen.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Bezahlen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 1;
	condition   = DIA_Jesper_Bezahlen_Condition;
	information = DIA_Jesper_Bezahlen_Info;
	permanent   = TRUE;
	description	= "Kannst du mir was beibringen?";
};
FUNC INT DIA_Jesper_Bezahlen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (Jesper_TeachSneak == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	&& (Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Bezahlen_Info()
{	
	AI_Output (other, self, "DIA_Jesper_Bezahlen_15_00");//Kannst du mir was beibringen?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_01");//Klar, dir zeige ich das Schleichen sogar umsonst.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_02");//Willst du lernen, wie du dich lautlos bewegst? Kostet dich allerdings 100 Goldstücke.
		B_Say_Gold (self, other, Jesper_Cost);
		
		Info_ClearChoices (DIA_Jesper_Bezahlen);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Vielleicht später...(ZURÜCK)",DIA_Jesper_Bezahlen_Spaeter);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Okay, ich will schleichen lernen (100 Gold zahlen)",DIA_Jesper_Bezahlen_Okay);
	};
};
FUNC VOID DIA_Jesper_Bezahlen_Spaeter()
{
	Info_ClearChoices (DIA_Jesper_Bezahlen);
};
FUNC VOID DIA_Jesper_Bezahlen_Okay()
{
	AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_00");//Okay, ich will schleichen lernen.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_01");//Hier ist das Gold.
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_02");//So, dann sag mir Bescheid, wenn du soweit bist.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_03");//Ohne Gold kannst du auch nichts lernen.
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Schleichen 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Schleichen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Schleichen_Condition;
	information = DIA_Jesper_Schleichen_Info;
	permanent   = TRUE;
	description = "Zeig mir die Kunst des Schleichens";
};
//--------------------------------------
var int DIA_Jesper_Schleichen_permanent;
//-------------------------------------- 
FUNC INT DIA_Jesper_Schleichen_Condition()
{	
	if (Jesper_TeachSneak == TRUE) 
	&& (DIA_Jesper_Schleichen_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Schleichen_Info()
{
	AI_Output (other, self, "DIA_Jesper_Schleichen_15_00");//Zeig mir die Kunst des Schleichens.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK)
	{
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_01");//Schleichen ist unabdingbar für jeden Dieb. Vor allem, wenn du in fremden Häusern unterwegs bist.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_02");//Hüte dich davor, einfach so reinzuspazieren. Die Leute haben einen sehr leichten Schlaf.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_03");//Nur wenn du schleichst, wird dich niemand hören - und du kannst ungehindert arbeiten.
		DIA_Jesper_Schleichen_permanent = TRUE;
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Freunde getötet
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Killer   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 2;
	condition   = DIA_Jesper_Killer_Condition;
	information = DIA_Jesper_Killer_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Jesper_Killer_Condition()
{	
	if Npc_IsDead (Cassia)
	|| Npc_IsDead (Ramirez)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Killer_Info()
{
	if  Npc_IsDead (Cassia)
	&&  Npc_IsDead (Ramirez)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_00");//Du hast meine Freunde umgebracht. Warum hast du das getan, du Mörder?
		AI_Output (self, other, "DIA_Jesper_Killer_09_01");//Ich werde jetzt dich in Beliars Reich schicken.
	}
	else if Npc_IsDead (Cassia)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_02");//Du hast Cassia umgebracht, du dreckiger Mörder. Aber an mir wirst du scheitern!
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE,1); 
	}
	else if  Npc_IsDead (Ramirez)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_03");//Ich hab mit Ramirez mehr Dinger gedreht und mehr Kohle einkassiert, als du jemals sehen wirst.
		AI_Output (self, other, "DIA_Jesper_Killer_09_04");//Und du dreckiger Hund bringst ihn einfach um! Jetzt wird abgerechnet!
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE,1); 
	};
	
};
//////////////////////////////////////////////////////////////////////
//	Info Bogen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Bogen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Bogen_Condition;
	information = DIA_Jesper_Bogen_Info;
	permanent   = FALSE;
	description = "Sag mal, weißt du was über Bospers Bogen? ";
};

FUNC INT DIA_Jesper_Bogen_Condition()
{	
	if (Npc_HasItems (other, ItRw_Bow_L_03_MIS) < 1)
	&& (MIS_Bosper_Bogen == LOG_RUNNING)
	&& (Join_Thiefs == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Bogen_Info()
{
	AI_Output (other, self, "DIA_Jesper_Bogen_15_00");//Sag mal, weißt du was über Bospers Bogen?
	AI_Output (self, other, "DIA_Jesper_Bogen_09_01");//Du meinst den Bogen vom Bogner? Ja, den habe ich irgendwo vorne in eine Truhe gepackt.
	AI_Output (self, other, "DIA_Jesper_Bogen_09_02");//Aber da wuseln jetzt Ratten rum. Kannst ihn dir ja holen, wenn dich die Viecher nicht stören.
	AI_Output (self, other, "DIA_Jesper_Bogen_09_03");//Ach so, natürlich ist die Truhe verschlossen. Du musst sie schon aufknacken. (grinst) Hoffentlich hast du noch Dietriche.
	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_01");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_02");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_03");
};
//////////////////////////////////////////////////////////////////////
//	Info Tür
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Tuer   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Tuer_Condition;
	information = DIA_Jesper_Tuer_Info;
	permanent   = FALSE;
	description = "Was ist hinter der verschlossenen Tür? ";
};

FUNC INT DIA_Jesper_Tuer_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& (Kapitel >= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Tuer_Info()
{
	AI_Output (other, self, "DIA_Jesper_Tuer_15_00");//Was ist hinter der verschlossenen Tür?
	AI_Output (self, other, "DIA_Jesper_Tuer_09_01");//(grinst) Dahinter befindet sich die Truhe - die Truhe des Meisters im Schlösser knacken. Fingers.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_02");//Er hat sie mit einem so unglaublich komplizierten Schloss versehen, dass sie bisher niemand aufgekriegt hat.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_03");//Leider wurde er geschnappt - sie haben ihn in die Barriere geworfen, wo er wahrscheinlich gestorben ist.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_04");//Aber wenn du versuchen willst, die Truhe zu öffnen, hier ist der Schlüssel zu dem Raum.
	
	B_GiveInvItems (self, other, ItKe_Fingers,1);
};
//////////////////////////////////////////////////////////////////////
//	Info Truhe
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Truhe   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Truhe_Condition;
	information = DIA_Jesper_Truhe_Info;
	permanent   = FALSE;
	description = "Ich habe die Truhe geknackt. ";
};

FUNC INT DIA_Jesper_Truhe_Condition()
{	
	if (Mob_HasItems ("MOB_FINGERS", Itmi_Gold) < 300)
	|| (Mob_HasItems ("MOB_FINGERS", Itmi_Silvercup) < 5)
	|| (Mob_HasItems ("MOB_FINGERS", Itmi_Goldcup) < 1)
	|| (Mob_HasItems ("MOB_FINGERS", ItAM_Strg_01) < 1)
	|| (Mob_HasItems ("MOB_FINGERS", ItPO_perm_Dex) < 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Truhe_Info()
{
	AI_Output (other, self, "DIA_Jesper_Truhe_15_00");//Ich habe die Truhe geknackt.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_01");//Das gibt's nicht! Sieht so aus, als hätten wir einen neuen Meister im Schlösserknacken!
	AI_Output (self, other, "DIA_Jesper_Truhe_09_02");//Ich gratuliere zu dieser Meisterleistung.
	
	B_GivePlayerXP (XP_JesperTruhe);
};  


