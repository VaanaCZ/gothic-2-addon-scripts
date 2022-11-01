///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_DI_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro_DI;
	nr          = 999;
	condition   = DIA_Pedro_DI_EXIT_Condition;
	information = DIA_Pedro_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_DI_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Verräter
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_YOU		(C_INFO)
{
	npc			 = 	NOV_600_Pedro_DI;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_DI_YOU_Condition;
	information	 = 	DIA_Pedro_DI_YOU_Info;
	
	description	 = 	"¡Traidor!";
	
};
func int DIA_Pedro_DI_YOU_Condition ()
{	
	return TRUE;
};

func void DIA_Pedro_DI_YOU_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_00"); //¡Traidor! Por fin te he encontrado.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_01"); //No creas que voy a apiadarme de ti porque soy uno de los paladines.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_02"); //Muchos de los mercenarios han vendido las almas a Beliar, y a menudo tengo remordimientos al matarlos como si tal cosa. Pero en tu caso, escoria, haré una excepción.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_03"); //De todos los bastardos desalmados con los que me he topado en mi vida, tú eres el peor. Eres una vergüenza para la orden.
		};

	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_04"); //Debería matarte ahora mismo.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_05"); //Basta, te lo suplico. Me han hechizado. Jamás habría traicionado al monasterio por mi propia voluntad.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_06"); //No tienes ni idea de lo que he sufrido estos últimos días. Me han metido una voz en la cabeza y no podía defenderme de ella.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_07"); //El coronel orco me interrogó durante días y no dejó de pegarme. Perdóname la vida. Soy inocente. Tienes que creerme.
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Entonces, dime lo que sabes.", DIA_Pedro_DI_YOU_verschon );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "No tengo que hacer nada. Voy a matarte ahora mismo.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Dame solo una razón para que te crea.", DIA_Pedro_DI_YOU_grund );
	if (MIS_Gorax_KillPedro == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Pedro_DI_YOU, "Serpentes me ordenó que te matara.", DIA_Pedro_DI_YOU_Serpentes );
	};
};

func void DIA_Pedro_DI_YOU_grund ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_grund_15_00"); //Dame solo una razón para que te crea.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_grund_09_01"); //(Suplicante) Déjame vivir. Puedo darte información que te ayudará a salir de aquí. Tienes que escucharme.

};
var int PedroDI_Flee;
func void DIA_Pedro_DI_YOU_tot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_tot_15_00"); //No tengo que hacer nada. Voy a matarte ahora mismo.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_tot_09_01"); //Por todos los dioses...

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Ship");
	B_Attack (self, other, AR_NONE, 1);
	PedroDI_Flee = LOG_RUNNING;
};

func void DIA_Pedro_DI_YOU_Serpentes ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_Serpentes_15_00"); //Serpentes me ordenó que te matara y, por cuestión de principios, obedezco.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_Serpentes_09_01"); //(Suplicante) No, por favor. No lo hagas. Aún te puedo ser útil, ya verás.

	B_GivePlayerXP (XP_Pedro_SerpentesMission);
	MIS_Gorax_KillPedro = LOG_SUCCESS;	//Joly: bei erfolgreicher Mission in folgenden Dialogen muss heißen; if ((Npc_IsDead(PedroDI)) && (MIS_Gorax_KillPedro == LOG_SUCCESS))

};

func void DIA_Pedro_DI_YOU_verschon ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_verschon_15_00"); //Entonces, dime lo que sabes.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_verschon_09_01"); //(Aliviado) Sí, por supuesto. Te diré todo lo que quieras saber... con una condición. Tienes que sacarme de esta isla maldita, ¿me oyes?
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "No tengo que hacer nada. Voy a matarte ahora mismo.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "De acuerdo. Sígueme, te llevaré al barco.", DIA_Pedro_DI_YOU_FollowShip );

};

var int MIS_Pedro_DI_FollowShip;
func void DIA_Pedro_DI_YOU_FollowShip ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_FollowShip_15_00"); //De acuerdo. Sígueme, te llevaré al barco.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_FollowShip_09_01"); //Gracias. No te vas a arrepentir.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_Pedro_DI_FollowShip = LOG_RUNNING;

};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedAtShip
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_ArrivedAtShip		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	4;
	condition	 = 	DIA_Pedro_DI_ArrivedAtShip_Condition;
	information	 = 	DIA_Pedro_DI_ArrivedAtShip_Info;

	description	= "¡Aquí está!";	
};

func int DIA_Pedro_DI_ArrivedAtShip_Condition ()
{
	if (Npc_GetDistToWP(self,"SHIP")<6000) 
	&& (MIS_Pedro_DI_FollowShip == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pedro_DI_ArrivedAtShip_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_00"); //¡Aquí está!
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_01"); //Tienes un barco impresionante. Desde luego, eres un gran general.
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_02"); //Deja de balbucear y dime lo que quiero saber.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_03"); //Eh... claro. ¿Por dónde empiezo?
	
	Info_ClearChoices	(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Ya he oído bastante.", DIA_Pedro_DI_ArrivedAtShip_Back );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "¿Cómo se va al interior de la isla?", DIA_Pedro_DI_ArrivedAtShip_Innere );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "¿Qué otros monstruos frecuentan esta isla?", DIA_Pedro_DI_ArrivedAtShip_Monster );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "¿Qué hay de ese coronel orco?", DIA_Pedro_DI_ArrivedAtShip_OrkOberst );


};
func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00"); //¿Qué hay de ese coronel orco?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01"); //Me arrebató la última pizca de esperanza de volver a ver mi tierra natal.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02"); //Desde que llegué, me ha estado interrogando acerca del posicionamiento estratégico de los paladines en Khorinis.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03"); //Por supuesto, no le dije gran cosa. ¿Cómo iba a hacerlo, maldita sea? Soy un novicio del fuego.
	
	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI)))
	{
		Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "El coronal orco ha muerto.", DIA_Pedro_DI_ArrivedAtShip_OberstTot );
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Monster_15_00"); //¿Qué otros monstruos frecuentan esta isla?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_01"); //Durante el día se suele ver al pueblo lagarto caminando hacia la costa. A menudo llevan huevos muy grandes.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_02"); //Desde mi celda no veía demasiado, pero creo que se están preparando para marcharse de la isla.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Innere_15_00"); //¿Cómo se va al interior de la isla?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_01"); //Hay un pasadizo secreto en el salón del trono del coronel orco.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_02"); //Me arrastraban hasta allí cada vez que querían interrogarme, y lo vi.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_03"); //Uno de los chamanes ponía en marcha un mecanismo al tirar de las antorchas colgadas en las paredes del salón.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_04"); //Um... creo que primero tiraba de la antorcha de la izquierda y luego de la que está a la derecha, pero no me acuerdo bien.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_05"); //En la parte de atrás se abría de pronto un pasadizo secreto que se adentraba en la montaña.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_06"); //No sé dónde acaba el pasadizo.

};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00"); //El coronel orco ha muerto.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01"); //¿Muerto? Alabado sea Innos. Jamás olvidaré su repugnante rostro.

};

func void DIA_Pedro_DI_ArrivedAtShip_Back ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Back_15_00"); //Ya he oído bastante. Búscate un puesto en mi barco. Aún tienes cosas que hacer.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Back_09_01"); //Que el poder de Innos te acompañe. Rezaré por ti.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_PERM		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	5;
	condition	 = 	DIA_Pedro_DI_PERM_Condition;
	information	 = 	DIA_Pedro_DI_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Estás cansado?";
};
var int PedroDI_TalkNomore;
func int DIA_Pedro_DI_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pedro_DI_YOU))
	&& (PedroDI_TalkNomore == FALSE)
		{
				return TRUE;
		};
};
func void DIA_Pedro_DI_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_00"); //¿Estás cansado?

	if (Npc_GetDistToWP(self,"SHIP_DECK_05")<1000) 
	{	
		if (PedroDI_Flee == LOG_RUNNING)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_01"); //¿Quieres que te traiga una almohada?
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_02"); //Déjame, por favor. Me quedaré muy quieto y no haré ruido.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_03"); //Um.
			B_GivePlayerXP (XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if (Npc_IsDead(Dragon_Undead))
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_04"); //Estoy agotado.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_05"); //Métete en el sobre. Pronto zarparemos.
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_06"); //Gracias, tío. Pensaba que me iba a caer de este banco. Buenas noches.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_07"); //No pasa nada. Gracias.
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_08"); //Por favor. ¡Déjame vivir!
		AI_StopProcessInfos (self);
	};
};

