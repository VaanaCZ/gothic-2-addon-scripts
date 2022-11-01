///////////////////////////////////////////////////////////////////////
//	Info FIRST EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1013_BANDIT_FIRSTEXIT   (C_INFO)
{
	npc         = BDT_1013_Bandit_L;
	nr          = 999;
	condition   = DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition;
	information = DIA_BDT_1013_BANDIT_FIRSTEXIT_Info;
	permanent   = FALSE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_BDT_1013_BANDIT_FIRSTEXIT_Info()
{
	if (Bdt13_Friend == TRUE)
	&& (!Npc_IsDead (Ambusher_1014)) 
	&& (!Npc_IsDead (Ambusher_1015))
	{
		AI_Output	(self, other, "DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00"); //Yo que tú no me metería en la cueva. Mis amigos te curtirían a palos, y se les da bien pelear.
	};
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1013_BANDIT_EXIT   (C_INFO)
{
	npc         = BDT_1013_Bandit_L;
	nr          = 999;
	condition   = DIA_BDT_1013_BANDIT_EXIT_Condition;
	information = DIA_BDT_1013_BANDIT_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1013_BANDIT_EXIT_Condition()
{	
	if Npc_KnowsInfo (other,DIA_BDT_1013_BANDIT_FIRSTEXIT)
	{
		return TRUE;
	};
};
FUNC VOID DIA_BDT_1013_BANDIT_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WHERE
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1013_BANDIT_WHERE		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	3;
	condition	 = 	DIA_BDT_1013_BANDIT_WHERE_Condition;
	information	 = 	DIA_BDT_1013_BANDIT_WHERE_Info;
	PERMANENT	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_BDT_1013_BANDIT_WHERE_Condition ()
{	
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_WHERE_Info ()
{
	AI_Output			(self, other, "DIA_BDT_1013_BANDIT_WHERE_01_00"); //Oye, ¿de dónde vienes?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Vengo de las montañas.",DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN);	
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Me manda Xardas...",DIA_BDT_1013_BANDIT_WHERE_XARDAS);
};
//-------------------------------------------------------------------------------------------
FUNC VOID DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00"); //Vengo de las montañas.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01"); //Eso es. Vienes de las montañas. Y eso es malo para ti.
	B_UseFakeScroll();
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02"); //Muy malo.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03"); //Un montón de tipos malos te busca.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04"); //Desde luego, tienes que hablar con una persona. ¡Sígueme!
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"A lo mejor más tarde...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"¿Quién me busca?",DIA_BDT_1013_BANDIT_WHERE_WHO);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"¡Muy bien! ¡Tú primero!",DIA_BDT_1013_BANDIT_WHERE_YES);
};

FUNC VOID DIA_BDT_1013_BANDIT_WHERE_XARDAS()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00"); //Me manda Xardas...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01"); //¿Ése es el viejo hechicero? Se llama Xardas... A Brago le va a interesar saberlo...
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
}; 

FUNC VOID DIA_BDT_1013_BANDIT_WHERE_YES()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_YES_15_00"); //¡Muy bien! ¡Tú primero!
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_YES_01_01"); //Sígueme, la cueva está aquí mismo.
	
	Npc_ExchangeRoutine	(self,"AMBUSH"); 
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_BDT_1013_BANDIT_WHERE_WHO()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_WHO_15_00"); //¿Quién me busca?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_WHO_01_01"); //¿Te busca la mitad de Khorinis e intentas convencerme de que no sabes nada?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_WHO_01_02"); //¡Ah! ¡Ya lo entiendo! Lo que pasa es que no quieres hablar conmigo del asunto, ¿eh? Muy bien, es tu problema.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_WHO_01_03"); //¿Vienes o no?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"A lo mejor más tarde...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"¿Con quién tengo que hablar?",DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"¡Muy bien! ¡Tú primero!",DIA_BDT_1013_BANDIT_WHERE_YES);
};

func void DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00"); //¿Con quién tengo que hablar?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01"); //Con mi jefe. Se llama Brago, y te explicará todo mejor que yo.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02"); //Bueno, ¿qué? ¿Vamos?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"A lo mejor más tarde...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"¿Cómo sé que no es una trampa?",DIA_BDT_1013_BANDIT_WHERE_NOTRAP);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"¡Muy bien! ¡Tú primero!",DIA_BDT_1013_BANDIT_WHERE_YES);
};
	
func void DIA_BDT_1013_BANDIT_WHERE_NOTRAP()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00"); //¿Cómo sé que no es una trampa?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01"); //Mira, me estoy cansando. Si no quieres que te ayude, vete a la ciudad y deja que te enchironen.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02"); //Si no vienes ahora, olvídate del asunto, ¿vale?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"A lo mejor más tarde...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Ya me han intentado engañar...",DIA_BDT_1013_BANDIT_WHERE_DAMALS);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"¡Muy bien! ¡Tú primero!",DIA_BDT_1013_BANDIT_WHERE_YES);
};

func void DIA_BDT_1013_BANDIT_WHERE_DAMALS()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00"); //¡Tranquilo, amigo mío! Es que ya me han intentado engañar...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01"); //¿Ah, sí?
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02"); //Un tipo me sugirió que consiguiéramos un amuleto y compartiéramos las ganancias.
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03"); //Cuando lo logramos, sus amigos y él me atacaron.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04"); //Parece que te relacionaste con malas compañías. ¿Dónde fue eso?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"No tiene importancia.",DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Cuando estuve preso en la colonia minera.",DIA_BDT_1013_BANDIT_WHERE_PRISONER);
};

func void DIA_BDT_1013_BANDIT_WHERE_PRISONER()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00"); //Cuando estuve preso en la colonia minera.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01"); //(Atónito) ¿Vienes de detrás de la barrera? Vaya, entonces estuvimos juntos.
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02"); //No te conozco...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03"); //Era cavador en el Campamento Viejo. No tenía que ver mucho con todo lo demás.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04"); //(Con complicidad) Pero ahora lo más importante es que... ¡estás metido en un buen lío!
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05"); //Alguien ha puesto un buen precio a tu cabeza y ha repartido unos cuantos carteles... ¡con tu retrato!
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06"); //Yo que tú me andaría con mucho cuidado. Con nosotros hay gente que mataría a su madre por dinero.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07"); //¡Pero yo creo que los chicos de la colonia penal tenemos que apoyarnos!
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08"); //Creo que debo darte las gracias...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09"); //No es nada. Asegúrate de seguir vivo...
	
	Bdt13_Friend = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY);
	self.npctype = NPCTYPE_FRIEND;
	self.aivar[AIV_EnemyOverride] = FALSE;
		
	Info_ClearChoices (DIA_BDT_1013_BANDIT_WHERE);
};

func void DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00"); //No tiene importancia.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01"); //Haz lo que quieras. ¿Vamos o no?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"A lo mejor más tarde...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"¡Muy bien! ¡Tú primero!",DIA_BDT_1013_BANDIT_WHERE_YES);
};

func VOID DIA_BDT_1013_BANDIT_WHERE_LATER()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_LATER_15_00"); //A lo mejor más tarde...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_LATER_01_01"); //¡Para ti no habrá un 'más tarde', amigo!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};


///////////////////////////////////////////////////////////////////////
//	Info AMBUSH
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_AMBUSH		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	1;
	condition	 = 	DIA_1013_BANDIT_AMBUSH_Condition;
	information	 = 	DIA_1013_BANDIT_AMBUSH_Info;
	PERMANENT	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_1013_BANDIT_AMBUSH_Condition ()
{	
	if (Npc_GetDistToWP (self, "NW_XARDAS_BANDITS_RIGHT") <= 300)
	&& (Bdt13_Friend == FALSE)
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_AMBUSH_Info ()
{
	if (Npc_IsDead(Ambusher_1014))
	&& (Npc_IsDead(Ambusher_1015))
	{
		AI_Output			(self, other, "DIA_1013_BANDIT_AMBUSH_01_00"); //Fue una estupidez que me siguieras...
		B_Attack 			(self, other, AR_SuddenEnemyInferno, 1);
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_1013_BANDIT_AMBUSH_01_01"); //Eh, tíos, mirad lo que tengo...
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DEXTER
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_NAME (C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	1;
	condition	 = 	DIA_1013_BANDIT_NAME_Condition;
	information	 = 	DIA_1013_BANDIT_NAME_Info;
	PERMANENT	 =  FALSE;	
	description	 = 	"¿Quién paga la recompensa?";
};
func int DIA_1013_BANDIT_NAME_Condition ()
{	
	if (Bdt13_Friend == TRUE) 
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_NAME_Info ()
{
	AI_Output (other, self, "DIA_1013_BANDIT_NAME_15_00"); //¿Quién paga la recompensa?
	AI_Output (self, other, "DIA_1013_BANDIT_NAME_01_01"); //No lo sé. Solo uno de nosotros lo conoce.
	AI_Output (other, self, "DIA_1013_BANDIT_NAME_15_02"); //¿Y quién es?
	AI_Output (self, other, "DIA_1013_BANDIT_NAME_01_03"); //Eh, tío, no te lo puedo decir. Ya sabes cómo son las cosas...
	
	Log_CreateTopic (Topic_Bandits,LOG_MISSION);
	Log_SetTopicStatus (Topic_Bandits,LOG_RUNNING);
	B_LogEntry (Topic_Bandits,"Hay bandidos que van tras de mí. Tiene un cartel de ''se busca''. Me pregunto qué habrá detrás de todo esto.");
	MIS_Steckbriefe = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info DEXTER verpetzen
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_DEXTER		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	1;
	condition	 = 	DIA_1013_BANDIT_DEXTER_Condition;
	information	 = 	DIA_1013_BANDIT_DEXTER_Info;
	PERMANENT	 =  TRUE;	
	description	 = 	"10 monedas de oro por el nombre del tipo que ofreció la recompensa.";
};
func int DIA_1013_BANDIT_DEXTER_Condition ()
{	
	if (Bdt13_Friend == TRUE) 
	&& (Bdt13_Dexter_verraten == FALSE) 
	&& (Npc_KnowsInfo (other, DIA_1013_BANDIT_NAME))
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_DEXTER_Info ()
{
	AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_00"); //10 monedas de oro por el nombre del tipo que ofreció la recompensa.
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_01"); //Oh, tío, no puedo...
	AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_02"); //¡Suéltalo de una vez!
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_03"); //(Respira hondo) ¡Tío! Vale. Se llama Dexter. Cerca de la granja grande hay una peña escarpada.
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_04"); //Allí hay una atalaya y unas cuantas minas. Tiene su escondite en los alrededores.
	
	B_LogEntry (Topic_Bandits,"El líder de los bandidos es Dexter. Se esconde en una mina cerca de la propiedad del terrateniente.");
	
	if (B_GiveInvItems(other, self, itmi_gold, 10))
	{
		AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_05"); //¿Ves? Tampoco era tan difícil. Toma el oro.
	}
	else
	{
		AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_06"); //Esto... Me acabo de dar cuenta de que no me quedan diez monedas de oro.
		AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_07"); //¡¿Qué?! Yo... Oh, olvídalo... Es culpa mía. No debería haberte dicho el nombre antes de ver el oro...
	};
	
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_08"); //No les cuentes quién te lo ha dicho.
			
	Bdt13_Dexter_verraten = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info PIC
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_PIC		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	2;
	condition	 = 	DIA_1013_BANDIT_PIC_Condition;
	information	 = 	DIA_1013_BANDIT_PIC_Info;
	PERMANENT	 =  FALSE;	
	description	 = 	"¿Me das el retrato?";
};
func int DIA_1013_BANDIT_PIC_Condition ()
{	
	if (Bdt13_Friend == TRUE) 
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_PIC_Info ()
{
	AI_Output (other, self, "DIA_1013_BANDIT_PIC_15_00"); //¿Me das el retrato?
	AI_Output (self, other, "DIA_1013_BANDIT_PIC_01_01"); //Claro (se ríe de oreja a oreja). Al fin y al cabo, es tu careto.
	B_GiveInvItems (self, other, ItWr_Poster_MIS,1);
};

///////////////////////////////////////////////////////////////////////
//						MALETHs Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_FromMaleth		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	3;
	condition	 = 	DIA_1013_BANDIT_FromMaleth_Condition;
	information	 = 	DIA_1013_BANDIT_FromMaleth_Info;
	permanent	 = 	FALSE;
	description	 = 	"Me manda uno de los granjeros de las afueras de la ciudad.";
};
func int DIA_1013_BANDIT_FromMaleth_Condition ()
{	
	if (Bdt13_Friend == TRUE) 
	&& ( (MIS_Maleth_Bandits == LOG_RUNNING) || (MIS_Maleth_Bandits == LOG_SUCCESS) )
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_FromMaleth_Info ()
{
	AI_Output (other, self, "DIA_1013_BANDIT_FromMaleth_15_00"); //Me manda uno de los granjeros de las afueras de la ciudad.
	AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_01"); //¿Qué? ¿Los granjeros conocen el escondite?
	AI_Output (other, self, "DIA_1013_BANDIT_FromMaleth_15_02"); //Se han dado cuenta de que faltan ovejas.
	
	var C_NPC b14; b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	var C_NPC b15; b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);

	if (Npc_IsDead (b14))
	&& (Npc_IsDead (b15))
	{
		AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_03"); //¡Maldita sea! Entonces tendré que largarme. Si encuentran vacío el escondite, a lo mejor no siguen buscándome.
	}
	else //mindestens einer lebt noch
	{
		AI_Output (other, self, "DIA_1013_BANDIT_FromMaleth_15_04"); //Quiere veros muertos a todos...
		AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_05"); //Espera... no vas a matarme, ¿verdad? ¡Te he ayudado!
		AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_06"); //¡Si tienes tantas ganas de derramar sangre, métete con los otros! ¡Yo voy a mantenerme al margen!
	};
	
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP (XP_BanditWeg);
	
	Npc_ExchangeRoutine	(self,"AWAY");
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//						CAVALORNs Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_FromCavalorn (C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	3;
	condition	 = 	DIA_1013_BANDIT_FromCavalorn_Condition;
	information	 = 	DIA_1013_BANDIT_FromCavalorn_Info;
	permanent	 = 	FALSE;
	description	 = 	"¡Dentro de poco, va a haber muchos problemas por aquí!";
};
func int DIA_1013_BANDIT_FromCavalorn_Condition ()
{	
	if (Bdt13_Friend == TRUE) 
	&& (MIS_Addon_Cavalorn_KillBrago == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_FromCavalorn_Info ()
{
	AI_Output (other, self, "DIA_ADDON_1013_BANDIT_FromCavalorn_15_00"); //¡Dentro de poco, va a haber muchos problemas por aquí!
	AI_Output (self, other, "DIA_ADDON_1013_BANDIT_FromCavalorn_01_01"); //¿Qué pasa?
	AI_Output (other, self, "DIA_ADDON_1013_BANDIT_FromCavalorn_15_02"); //¡Un tipo llamado Cavalorn viene a por ti!
	AI_Output (self, other, "DIA_ADDON_1013_BANDIT_FromCavalorn_01_03"); //¡Diablos! ¿Sigue vivo? Me largo.

	Bdt_1013_Away = TRUE;
	B_GivePlayerXP (XP_BanditWeg);
	
	Npc_ExchangeRoutine	(self,"AWAY2");
	
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//							PERM
///////////////////////////////////////////////////////////////////////

// ------------------------------
	var int bdt13_Gossip_Wildnis;
// ------------------------------

instance DIA_1013_BANDIT_PERM		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	4;
	condition	 = 	DIA_1013_BANDIT_PERM_Condition;
	information	 = 	DIA_1013_BANDIT_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"¿Hay algo más que pueda interesarme?";
};
func int DIA_1013_BANDIT_PERM_Condition ()
{	
	if (Bdt13_Friend == TRUE)
	
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_PERM_Info ()
{
	AI_Output (other, self, "DIA_1013_BANDIT_PERM_15_00"); //¿Hay algo más que pueda interesarme?

	if (bdt13_Gossip_Wildnis == FALSE)
	{
		AI_Output (self, other, "DIA_1013_BANDIT_PERM_01_01"); //¿Te refieres a esta zona? Si quieres seguir vivo, no te apartes de los caminos.
		AI_Output (self, other, "DIA_1013_BANDIT_PERM_01_02"); //Cuando más te internas en la espesura, más peligroso es.
		bdt13_Gossip_Wildnis = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_1013_BANDIT_PERM_01_03"); //Ya te he contado todo lo que sé.
	};
};











