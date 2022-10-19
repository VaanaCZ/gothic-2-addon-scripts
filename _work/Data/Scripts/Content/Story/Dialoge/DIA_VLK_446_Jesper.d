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
	AI_Output (self, other,"DIA_Jesper_Hallo_09_00");//Eh, �qu� est�s haciendo aqu� abajo? Aqu� no hay nada para ti.
	AI_Output (self, other,"DIA_Jesper_Hallo_09_01");//Venga, desembucha, �qu� est�s haciendo aqu�?
		
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"He venido a matarte.",DIA_Jesper_Hallo_Kill);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Quer�a dar un peque�o vistazo.",DIA_Jesper_Hallo_NurSo);
		
	if  (Attila_Key == TRUE)
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Attila me dio una llave...",DIA_Jesper_Hallo_Willkommen);
	}	
	else 
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Me he cargado a Attila.",DIA_Jesper_Hallo_Umgelegt);
	};
	
	DG_gefunden = TRUE;
	
};
FUNC VOID DIA_Jesper_Hallo_Kill()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Kill_15_00");//He venido a matarte.
	AI_Output (self, other,"DIA_Jesper_Hallo_Kill_09_01");//Qu� idea tan maravillosa. La has pensado t� solito, �no? Bueno, �y qu�? Har� que sea r�pido.
	
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Jesper_Hallo_NurSo()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_NurSo_15_00");//Quer�a dar un peque�o vistazo.
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_01");//Aqu� no hay nada que ver. Caminas sobre terreno peligroso, �entiendes?
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_02");//As� que deja tu arma donde est� y dime por qu� est�s aqu�.
};
FUNC VOID DIA_Jesper_Hallo_Willkommen()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Willkommen_15_00");//Attila me dio una llave. Por eso estoy aqu�. �Qu� quieres de m�?
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_01");//�No te gustar�a saberlo? Tranquilo.
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_02");//Ve a ver a Cassia. Te espera.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID DIA_Jesper_Hallo_Umgelegt()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Umgelegt_15_00");//Me he cargado a Attila. Llevaba encima la llave de las alcantarillas.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_01");//(Incr�dulo) ��T� has matado a Attila?! (Desde�osamente) �Y qu�?, no era m�s que un perro sarnoso.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_02");//Pero te dir� algo: si me atacas, te matar�.
	
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"�Qu� est�s haciendo aqu�...?",DIA_Jesper_Hallo_Was);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Ll�vame con tu l�der.",DIA_Jesper_Hallo_Anfuehrer);
};
FUNC VOID DIA_Jesper_Hallo_Was()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Was_15_00");//�Qu� est�s haciendo aqu�, en este oscuro y h�medo agujero?
	AI_Output (self, other,"DIA_Jesper_Hallo_Was_09_01");//(Gru�e) Vivo aqu�. Una pregunta est�pida m�s y te har� un tatuaje en la espalda.
};
FUNC VOID DIA_Jesper_Hallo_Anfuehrer()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Anfuehrer_15_00");//Ll�vame con tu l�der.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_01");//(Se r�e) JA, �mi l�der? Estoy seguro de que Cassia querr� hablar contigo.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_02");//Adelante. Y no intentes enga�arme.
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
	description	= "�Puedes ense�arme algo?";
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
	AI_Output (other, self, "DIA_Jesper_Bezahlen_15_00");//�Puedes ense�arme algo?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_01");//Claro, te ense�ar� a moverte con sigilo. Para ti es gratis.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_02");//�Quieres aprender a moverte sin hacer un ruido? Eso te costar� 100 monedas de oro.
		B_Say_Gold (self, other, Jesper_Cost);
		
		Info_ClearChoices (DIA_Jesper_Bezahlen);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Puede que despu�s... (ATR�S)",DIA_Jesper_Bezahlen_Spaeter);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Vale, quiero aprender a ser sigiloso (pagar 100 de oro).",DIA_Jesper_Bezahlen_Okay);
	};
};
FUNC VOID DIA_Jesper_Bezahlen_Spaeter()
{
	Info_ClearChoices (DIA_Jesper_Bezahlen);
};
FUNC VOID DIA_Jesper_Bezahlen_Okay()
{
	AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_00");//De acuerdo, quiero aprender a moverme con sigilo.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_01");//Aqu� tienes el oro.
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_02");//Bueno, pues dime cuando est�s preparado.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_03");//No se puede aprender nada sin oro.
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
	description = "Ens��ame el arte del sigilo.";
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
	AI_Output (other, self, "DIA_Jesper_Schleichen_15_00");//Ens��ame el arte de moverse con sigilo.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK)
	{
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_01");//Moverse sigilosamente es esencial para todos los ladrones. Sobre todo, cuando est�s revolviendo en casa de alguien.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_02");//No puedes entrar a lo bestia. La mayor�a de la gente tiene el sue�o poco profundo.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_03");//Solo pasar�s desapercibido si te mueves con sigilo. Y podr�s trabajar sin estorbos.
		DIA_Jesper_Schleichen_permanent = TRUE;
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Freunde get�tet
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
		AI_Output (self, other, "DIA_Jesper_Killer_09_00");//Mataste a mis amigos. �Por qu� hiciste eso, asesino?
		AI_Output (self, other, "DIA_Jesper_Killer_09_01");//Te enviar� al reino de Beliar.
	}
	else if Npc_IsDead (Cassia)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_02");//Mataste a Cassia, sucio asesino. �Pero no pasar�s por encima de m�!
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE,1); 
	}
	else if  Npc_IsDead (Ramirez)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_03");//He hecho m�s cosas por Ram�rez y obtenido m�s dinero del que t� nunca ver�s.
		AI_Output (self, other, "DIA_Jesper_Killer_09_04");//�Y t� acabas de matarlo, perro sarnoso! �Es hora de enfrentarse a las consecuencias!
		
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
	description = "Esto, �por casualidad sabes algo sobre el arco de Bosper?";
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
	AI_Output (other, self, "DIA_Jesper_Bogen_15_00");//Esto, �por casualidad sabes algo sobre el arco de Bosper?
	AI_Output (self, other, "DIA_Jesper_Bogen_09_01");//�Te refieres al arco del arquero? S�, lo tengo guardado por alg�n sitio, en la parte de arriba de un cofre.
	AI_Output (self, other, "DIA_Jesper_Bogen_09_02");//Pero hay ratas correteando por all�. Puedes cogerlo, si los bichos no te molestan.
	AI_Output (self, other, "DIA_Jesper_Bogen_09_03");//Oh, claro, el cofre est� cerrado. Tendr�s que abrirlo. (Sonr�e) Por suerte, a�n tienes ganz�as.
	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_01");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_02");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_03");
};
//////////////////////////////////////////////////////////////////////
//	Info T�r
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Tuer   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Tuer_Condition;
	information = DIA_Jesper_Tuer_Info;
	permanent   = FALSE;
	description = "�Qu� hay detr�s de esa puerta cerrada?";
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
	AI_Output (other, self, "DIA_Jesper_Tuer_15_00");//�Qu� hay detr�s de esa puerta cerrada?
	AI_Output (self, other, "DIA_Jesper_Tuer_09_01");//(Sonr�e) Detr�s de ah� est� el cofre. El cofre del maestro abridor de cerraduras. Dedos.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_02");//Puso una cerradura tan incre�blemente complicada ah�, que nadie ha sido capaz de abrirlo, por el momento.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_03");//Desafortunadamente, le cazaron. Le arrojaron por la Barrera, donde probablemente muri�.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_04");//Pero si quieres probar a abrir el cofre, aqu� est� la llave de la habitaci�n.
	
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
	description = "Consegu� abrir el cofre.";
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
	AI_Output (other, self, "DIA_Jesper_Truhe_15_00");//Consegu� abrir el cofre.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_01");//�Eso es imposible! Parece que tenemos un nuevo maestro forzador de cerraduras.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_02");//Enhorabuena por este logro.
	
	B_GivePlayerXP (XP_JesperTruhe);
};  


