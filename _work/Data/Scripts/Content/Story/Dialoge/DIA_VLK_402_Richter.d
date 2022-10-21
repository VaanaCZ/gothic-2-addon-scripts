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
	description = "¿Qué estás haciendo aquí?";
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
	AI_Output (other,self ,"DIA_Richter_Hello_15_00"); //¿Qué estás haciendo aquí?
	AI_Output (self ,other,"DIA_Richter_Hello_10_01"); //¿Por qué me abordas? ¿Y tú quién eres?
	AI_Output (other,self ,"DIA_Richter_Hello_15_02"); //Yo, esto...
	AI_Output (self ,other,"DIA_Richter_Hello_10_03"); //Oye, ¿no te conozco de algo?
	
	Info_ClearChoices (DIA_Richter_Hello);
	Info_AddChoice (DIA_Richter_Hello,"No, que yo recuerde.",DIA_Richter_Hello_DontThinkSo);
	Info_AddChoice (DIA_Richter_Hello,"Será eso.",DIA_Richter_Hello_MayBe);
};

FUNC VOID DIA_Richter_Hello_DontThinkSo ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_DontThinkSo_15_00"); //No, que yo recuerde.
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_01"); //Qué raro. Juraría que ya nos conocíamos.
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_02"); //Da igual, de todas formas, eres una escoria. Os parecéis todos.
};

FUNC VOID DIA_Richter_Hello_MayBe ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_MayBe_15_00"); //Será eso.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_01"); //¡No seas engreído! ¿Con quién te crees que estás hablando?
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_02"); //Lo menos que puedes hacer es dirigirte a mí en el tono apropiado.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_03"); //Y ahora, ¡aléjate de mi vista!
	
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
	description = "¿Qué pasa?";
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
	AI_Output (other,self ,"DIA_Richter_Perm_15_00"); //¿Cómo va todo?

	if (MIS_Lee_JudgeRichter == LOG_RUNNING)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG ))
	{
		AI_Output (self ,other,"DIA_Richter_Perm_10_01"); //Será mejor que te pires, mercenario inmundo, antes de que llame a los guardias.
		AI_Output (other,self ,"DIA_Richter_Perm_15_02"); //Relájate. No estoy aquí para robarte. Busco trabajo.
		AI_Output (self ,other,"DIA_Richter_Perm_10_03"); //¡Ah! Así que quieres trabajar para mí. Mmm. Eso es otra cosa, por supuesto.
		AI_Output (self ,other,"DIA_Richter_Perm_10_04"); //Pero hay un pequeño problema. No sé si puedo confiar en ti. Primero tendrás que demostrarme tu lealtad.
		SCIstRichtersLakai = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Richter_Perm_10_05"); //¿No he dejado claro que no quiero ningún contacto contigo?
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
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_01"); //Mmm. De acuerdo. Escucha. Tráeme el martillo sagrado de los magos de fuego. Lo guardan en algún sitio, en los sótanos de su monasterio.
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_02"); //Si consigues hacerte con él, podría considerar lo de contratarte como guardaespaldas.
	
	Info_ClearChoices	(DIA_Richter_RichtersLakai);
	Info_AddChoice	(DIA_Richter_RichtersLakai, "¿Se supone que debo robar a los magos? Estás fuera de tus cabales.", DIA_Richter_RichtersLakai_nein );
	Info_AddChoice	(DIA_Richter_RichtersLakai, "De acuerdo.", DIA_Richter_RichtersLakai_ja );
	
	B_LogEntry (TOPIC_RichterLakai,"El juez no confía en mí. Tengo que demostrarle mi lealtad. Voy a robar el martillo sagrado del sótano del monasterio de los magos de fuego y se lo voy a llevar."); 

	MIS_Richter_BringHolyHammer = LOG_RUNNING;
};
func void DIA_Richter_RichtersLakai_nein ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_nein_15_00"); //¿Se supone que debo robar a los magos? Estás fuera de tus cabales.
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_nein_10_01"); //Entonces vete al infierno y deja de malgastar mi tiempo.
	AI_StopProcessInfos (self);
};

func void DIA_Richter_RichtersLakai_ja ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_ja_15_00"); //De acuerdo.
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_ja_10_01"); //Bien. Pero recuerda que si te pillan, yo no sé nada de ti.
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

	description =	"Aquí tienes el martillo sagrado de los magos.";
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
	AI_Output (other,self ,"DIA_Richter_KillMorgahard_15_00"); //Aquí tienes el martillo sagrado de los magos.
	B_GiveInvItems (other, self, Holy_Hammer_MIS,1);
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_01"); //Estoy realmente impresionado. Vas en serio, ¿no? Aquí tienes tu paga.
	CreateInvItems (self, ItMi_Gold, 300);									
	B_GiveInvItems (self, other, ItMi_Gold, 300);					
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_02"); //Bien. Si es así, tengo otra tarea para ti.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_03"); //Hace unos días, varios prisioneros escaparon de la cárcel local.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_04"); //Esos perros han huido hacia las montañas. En dirección a la nueva torre de Xardas.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_05"); //El nombre de su líder es Morgahard. Quiero que lo mates.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_06"); //Apresúrate antes de que desaparezcan del todo.
	
	Wld_InsertNpc	(BDT_1030_Morgahard,"REICH"); 
	Wld_InsertNpc	(BDT_1031_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1032_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1033_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1034_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1035_Fluechtling,"REICH"); 

	B_InitNpcGlobals ();

	B_GivePlayerXP (XP_BringHolyHammer);
	MIS_Richter_BringHolyHammer = LOG_SUCCESS;
	B_LogEntry (TOPIC_RichterLakai,"Algunos prisioneros han escapado del juez. Tengo que cazarlos y abatir a su líder, MORGAHARD. Se cree que se esconden en las montañas, en algún lugar de camino a la nueva torre de Xardas."); 
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

	description =	"Morgahard está muerto.";
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
	AI_Output (other,self ,"DIA_Richter_KilledMorgahard_15_00"); //Morgahard está muerto.
	AI_Output (self ,other,"DIA_Richter_KilledMorgahard_10_01"); //Ah. Eres un buen chico. Aquí tienes tu recompensa.
	CreateInvItems (self, ItMi_Gold, 400);									
	B_GiveInvItems (self, other, ItMi_Gold, 400);					
	B_GivePlayerXP (XP_KillMorgahard);
	B_LogEntry (TOPIC_RichterLakai,"Era evidente que el juez se alegraba de la muerte de Morgahard. Oh, bueno, que lo disfrute. No debo olvidarme de la misión de Lee."); 
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

	description =	"¿Hay algo más que pueda hacer por ti?";
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
	AI_Output (other,self ,"DIA_Richter_KilledMorgahardPERM_15_00"); //¿Hay algo más que pueda hacer por ti?
	AI_Output (self ,other,"DIA_Richter_KilledMorgahardPERM_10_01"); //Ahora no. Quizá más tarde.
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

	description =	"Dame una autorización escrita para el barco de los paladines.";
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
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_00"); //Dame una autorización escrita para el barco de los paladines.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_01"); //(Se ríe) Debes estar chalado. ¿Qué quieres que haga?
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_02"); //Ya me has oído. Dame esa autorización o te delataré a la milicia.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_03"); //(Ruge) No me van a chantajear. ¡Y menos tú! Te echaré a los lobos, miserable montón de basura.
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_04"); //Morgahard asaltó al gobernador siguiendo tus órdenes. Poseo un documento que puede demostrarlo.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_05"); //(Ruge) Arrh.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_06"); //Lamentarás esto. Nadie me chantajea y se sale con la suya.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_07"); //Aquí tienes tu autorización. Ahora lárgate. Ya me ocuparé de ti en otro momento.
	CreateInvItems (self,ItWr_ForgedShipLetter_Mis,1);
	B_GiveInvItems (self,other,ItWr_ForgedShipLetter_Mis,1);
	B_LogEntry (TOPIC_Ship,"La carta de autorización debería permitirme tomar posesión de la nave sin el menor problema. Me pregunto qué dirá Lee."); 
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
	AI_Output (self ,other,"DIA_Richter_perm2_10_00"); //Aléjate de mi vista.
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
	description = "(Sería sencillo robar su llave)";
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




