// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Richter_EXIT(C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 999;
	condition	= DIA_Richter_EXIT_Condition;
	information	= DIA_Richter_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Richter_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Richter_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Richter_Hello(C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 4;
	condition	= DIA_Richter_Hello_Condition;
	information	= DIA_Richter_Hello_Info;
	permanent	= FALSE;
	description = "�Qu� est�s haciendo aqu�?";
};                       

FUNC INT DIA_Richter_Hello_Condition()
{
	if (MIS_Lee_JudgeRichter == 0)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Richter_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Richter_Hello_15_00"); //�Qu� est�s haciendo aqu�?
	AI_Output (self ,other,"DIA_Richter_Hello_10_01"); //�Por qu� me abordas? �Y t� qui�n eres?
	AI_Output (other,self ,"DIA_Richter_Hello_15_02"); //Yo, esto...
	AI_Output (self ,other,"DIA_Richter_Hello_10_03"); //Oye, �no te conozco de algo?
	
	Info_ClearChoices (DIA_Richter_Hello);
	Info_AddChoice (DIA_Richter_Hello,"No, que yo recuerde.",DIA_Richter_Hello_DontThinkSo);
	Info_AddChoice (DIA_Richter_Hello,"Ser� eso.",DIA_Richter_Hello_MayBe);
};

FUNC VOID DIA_Richter_Hello_DontThinkSo ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_DontThinkSo_15_00"); //No, que yo recuerde.
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_01"); //Qu� raro. Jurar�a que ya nos conoc�amos.
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_02"); //Da igual, de todas formas, eres una escoria. Os parec�is todos.
};

FUNC VOID DIA_Richter_Hello_MayBe ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_MayBe_15_00"); //Ser� eso.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_01"); //�No seas engre�do! �Con qui�n te crees que est�s hablando?
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_02"); //Lo menos que puedes hacer es dirigirte a m� en el tono apropiado.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_03"); //Y ahora, �al�jate de mi vista!
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Perm 
// ************************************************************

INSTANCE DIA_Richter_Perm(C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 800;
	condition	= DIA_Richter_Perm_Condition;
	information	= DIA_Richter_Perm_Info;
	permanent	= TRUE;
	description = "�Qu� pasa?";
};                       

FUNC INT DIA_Richter_Perm_Condition()
{
	if ((Npc_KnowsInfo (other,DIA_Richter_Hello)) || (MIS_Lee_JudgeRichter == LOG_RUNNING))
	&& (SCIstRichtersLakai == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_Perm_Info()
{	
	AI_Output (other,self ,"DIA_Richter_Perm_15_00"); //�C�mo va todo?

	if (MIS_Lee_JudgeRichter == LOG_RUNNING)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG ))
	{
		AI_Output (self ,other,"DIA_Richter_Perm_10_01"); //Ser� mejor que te pires, mercenario inmundo, antes de que llame a los guardias.
		AI_Output (other,self ,"DIA_Richter_Perm_15_02"); //Rel�jate. No estoy aqu� para robarte. Busco trabajo.
		AI_Output (self ,other,"DIA_Richter_Perm_10_03"); //�Ah! As� que quieres trabajar para m�. Mmm. Eso es otra cosa, por supuesto.
		AI_Output (self ,other,"DIA_Richter_Perm_10_04"); //Pero hay un peque�o problema. No s� si puedo confiar en ti. Primero tendr�s que demostrarme tu lealtad.
		SCIstRichtersLakai = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Richter_Perm_10_05"); //�No he dejado claro que no quiero ning�n contacto contigo?
		AI_Output (other,self ,"DIA_Richter_Perm_15_06"); //No, no con tantas palabras.
		AI_Output (self ,other,"DIA_Richter_Perm_10_07"); //Pues espero que ahora me entiendas perfectamente.
	};
};

// ************************************************************
// 			  				   RichtersLakai 
// ************************************************************

INSTANCE DIA_Richter_RichtersLakai (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_RichtersLakai_Condition;
	information	= DIA_Richter_RichtersLakai_Info;

	description = "Ponme a prueba.";
};                       

FUNC INT DIA_Richter_RichtersLakai_Condition()
{
	if ((Npc_KnowsInfo (other,DIA_Richter_Hello)) || (MIS_Lee_JudgeRichter != 0))
	&& (SCIstRichtersLakai == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_RichtersLakai_Info()
{	
	AI_Output (other,self ,"DIA_Richter_RichtersLakai_15_00"); //Ponme a prueba.
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_01"); //Mmm. De acuerdo. Escucha. Tr�eme el martillo sagrado de los magos de fuego. Lo guardan en alg�n sitio, en los s�tanos de su monasterio.
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_02"); //Si consigues hacerte con �l, podr�a considerar lo de contratarte como guardaespaldas.
	
	Info_ClearChoices	(DIA_Richter_RichtersLakai);
	Info_AddChoice	(DIA_Richter_RichtersLakai, "�Se supone que debo robar a los magos? Est�s fuera de tus cabales.", DIA_Richter_RichtersLakai_nein );
	Info_AddChoice	(DIA_Richter_RichtersLakai, "De acuerdo.", DIA_Richter_RichtersLakai_ja );
	
	B_LogEntry (TOPIC_RichterLakai,"El juez no conf�a en m�. Tengo que demostrarle mi lealtad. Voy a robar el martillo sagrado del s�tano del monasterio de los magos de fuego y se lo voy a llevar."); 

	MIS_Richter_BringHolyHammer = LOG_RUNNING;
};
func void DIA_Richter_RichtersLakai_nein ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_nein_15_00"); //�Se supone que debo robar a los magos? Est�s fuera de tus cabales.
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_nein_10_01"); //Entonces vete al infierno y deja de malgastar mi tiempo.
	AI_StopProcessInfos (self);
};

func void DIA_Richter_RichtersLakai_ja ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_ja_15_00"); //De acuerdo.
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_ja_10_01"); //Bien. Pero recuerda que si te pillan, yo no s� nada de ti.
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				   KillMorgahard 
// ************************************************************

INSTANCE DIA_Richter_KillMorgahard (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_KillMorgahard_Condition;
	information	= DIA_Richter_KillMorgahard_Info;

	description =	"Aqu� tienes el martillo sagrado de los magos.";
};                       

FUNC INT DIA_Richter_KillMorgahard_Condition()
{
	if (Npc_HasItems (other,Holy_Hammer_MIS))
	&& (MIS_Richter_BringHolyHammer == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_KillMorgahard_Info()
{	
	AI_Output (other,self ,"DIA_Richter_KillMorgahard_15_00"); //Aqu� tienes el martillo sagrado de los magos.
	B_GiveInvItems (other, self, Holy_Hammer_MIS,1);
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_01"); //Estoy realmente impresionado. Vas en serio, �no? Aqu� tienes tu paga.
	CreateInvItems (self, ItMi_Gold, 300);									
	B_GiveInvItems (self, other, ItMi_Gold, 300);					
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_02"); //Bien. Si es as�, tengo otra tarea para ti.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_03"); //Hace unos d�as, varios prisioneros escaparon de la c�rcel local.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_04"); //Esos perros han huido hacia las monta�as. En direcci�n a la nueva torre de Xardas.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_05"); //El nombre de su l�der es Morgahard. Quiero que lo mates.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_06"); //Apres�rate antes de que desaparezcan del todo.
	
	Wld_InsertNpc	(BDT_1030_Morgahard,"REICH"); 
	Wld_InsertNpc	(BDT_1031_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1032_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1033_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1034_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1035_Fluechtling,"REICH"); 

	B_InitNpcGlobals ();

	B_GivePlayerXP (XP_BringHolyHammer);
	MIS_Richter_BringHolyHammer = LOG_SUCCESS;
	B_LogEntry (TOPIC_RichterLakai,"Algunos prisioneros han escapado del juez. Tengo que cazarlos y abatir a su l�der, MORGAHARD. Se cree que se esconden en las monta�as, en alg�n lugar de camino a la nueva torre de Xardas."); 
	MIS_Richter_KillMorgahard = LOG_RUNNING;
	AI_StopProcessInfos (self);
};	

// ************************************************************
// 	  KilledMorgahard 
// ************************************************************

INSTANCE DIA_Richter_KilledMorgahard (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_KilledMorgahard_Condition;
	information	= DIA_Richter_KilledMorgahard_Info;

	description =	"Morgahard est� muerto.";
};                       

FUNC INT DIA_Richter_KilledMorgahard_Condition()
{
	if (Npc_IsDead(Morgahard))
	&& (MIS_Richter_KillMorgahard == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_KilledMorgahard_Info()
{	
	AI_Output (other,self ,"DIA_Richter_KilledMorgahard_15_00"); //Morgahard est� muerto.
	AI_Output (self ,other,"DIA_Richter_KilledMorgahard_10_01"); //Ah. Eres un buen chico. Aqu� tienes tu recompensa.
	CreateInvItems (self, ItMi_Gold, 400);									
	B_GiveInvItems (self, other, ItMi_Gold, 400);					
	B_GivePlayerXP (XP_KillMorgahard);
	B_LogEntry (TOPIC_RichterLakai,"Era evidente que el juez se alegraba de la muerte de Morgahard. Oh, bueno, que lo disfrute. No debo olvidarme de la misi�n de Lee."); 
	MIS_Richter_KillMorgahard = LOG_SUCCESS;
};

// ************************************************************
// 	  KilledMorgahardPERM 
// ************************************************************

INSTANCE DIA_Richter_KilledMorgahardPERM (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_KilledMorgahardPERM_Condition;
	information	= DIA_Richter_KilledMorgahardPERM_Info;
	permanent	 = 	TRUE;

	description =	"�Hay algo m�s que pueda hacer por ti?";
};                       

FUNC INT DIA_Richter_KilledMorgahardPERM_Condition()
{
	if (MIS_Richter_KillMorgahard == LOG_SUCCESS)
	&& (MIS_RichtersPermissionForShip == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_KilledMorgahardPERM_Info ()
{	
	AI_Output (other,self ,"DIA_Richter_KilledMorgahardPERM_15_00"); //�Hay algo m�s que pueda hacer por ti?
	AI_Output (self ,other,"DIA_Richter_KilledMorgahardPERM_10_01"); //Ahora no. Quiz� m�s tarde.
};

// ************************************************************
// 		 PermissionForShip 
// ************************************************************

INSTANCE DIA_Richter_PermissionForShip (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_PermissionForShip_Condition;
	information	= DIA_Richter_PermissionForShip_Info;

	description =	"Dame una autorizaci�n escrita para el barco de los paladines.";
};                       

FUNC INT DIA_Richter_PermissionForShip_Condition()
{
	if (MIS_RichtersPermissionForShip == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_PermissionForShip_Info ()
{	
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_00"); //Dame una autorizaci�n escrita para el barco de los paladines.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_01"); //(Se r�e) Debes estar chalado. �Qu� quieres que haga?
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_02"); //Ya me has o�do. Dame esa autorizaci�n o te delatar� a la milicia.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_03"); //(Ruge) No me van a chantajear. �Y menos t�! Te echar� a los lobos, miserable mont�n de basura.
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_04"); //Morgahard asalt� al gobernador siguiendo tus �rdenes. Poseo un documento que puede demostrarlo.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_05"); //(Ruge) Arrh.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_06"); //Lamentar�s esto. Nadie me chantajea y se sale con la suya.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_07"); //Aqu� tienes tu autorizaci�n. Ahora l�rgate. Ya me ocupar� de ti en otro momento.
	CreateInvItems (self,ItWr_ForgedShipLetter_Mis,1);
	B_GiveInvItems (self,other,ItWr_ForgedShipLetter_Mis,1);
	B_LogEntry (TOPIC_Ship,"La carta de autorizaci�n deber�a permitirme tomar posesi�n de la nave sin el menor problema. Me pregunto qu� dir� Lee."); 
	MIS_RichtersPermissionForShip = LOG_SUCCESS;
	B_GivePlayerXP (XP_RichtersPermissionForShip);
};

// ************************************************************
// 		 perm2 
// ************************************************************

INSTANCE DIA_Richter_perm2 (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_perm2_Condition;
	information	= DIA_Richter_perm2_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};                       

FUNC INT DIA_Richter_perm2_Condition()
{
	if (MIS_RichtersPermissionForShip == LOG_SUCCESS)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

FUNC VOID DIA_Richter_perm2_Info ()
{	
	AI_Output (self ,other,"DIA_Richter_perm2_10_00"); //Al�jate de mi vista.
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Richter_PICKPOCKET (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 900;
	condition	= DIA_Richter_PICKPOCKET_Condition;
	information	= DIA_Richter_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ser�a sencillo robar su llave)";
};                       

FUNC INT DIA_Richter_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_Richter) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Richter_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Richter_PICKPOCKET);
	Info_AddChoice		(DIA_Richter_PICKPOCKET, DIALOG_BACK 		,DIA_Richter_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Richter_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Richter_PICKPOCKET_DoIt);
};

func void DIA_Richter_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems (self, other, ItKe_Richter, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();	
		Info_ClearChoices (DIA_Richter_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Richter_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Richter_PICKPOCKET);
};




