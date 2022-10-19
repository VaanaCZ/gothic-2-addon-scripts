// -------------------------------------------------------------------------
// Nicos Satz
// -------------------------------------------------------------------------
func void B_Dragon_Undead_Bla()
{
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_00"); //�Y bien, chico? �Entonces tienes la copia original?
};

// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Undead_Exit(C_INFO)
{
	
	npc 		= Dragon_Undead;
	nr			= 999;
	condition	= DIA_Dragon_Undead_Exit_Condition;
	information	= DIA_Dragon_Undead_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Undead_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Undead_Exit_Info()
{	
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Undead_Hello(C_INFO)
{
	
	npc 		= Dragon_Undead;
	nr			= 5;
	condition	= DIA_Dragon_Undead_Hello_Condition;
	information	= DIA_Dragon_Undead_Hello_Info;

	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Undead_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Dragon_Undead_Hello_Info()
{	
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_00"); //As� que has logrado encontrarme. Llevo mucho tiempo esperando tu llegada.
	AI_Output (other, self, "DIA_Dragon_Undead_Hello_15_01"); //Venga, deja de fingir que lo ten�as planeado.
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_02"); //(Suelta una carcajada) �Qu� sabes t� de mis intenciones?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_03"); //�No te he enviado a los buscadores para que te pusieran tras mi pista?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_04"); //�No te he dejado se�ales claras de mi existencia para que pudieras encontrarme?

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_05"); //�No han servido los huevos de drag�n de materia prima para tu armadura, que te ha ayudado a llegar hasta m�?
	};

	if (hero.guild == GIL_PAL)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_06"); //�Acaso la conversi�n de los paladines no fue motivo suficiente para que intentases averiguar qui�n estaba detr�s?
	};

	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_07"); //�Acaso la posesi�n de tus semejantes no fue motivo suficiente para que intentases averiguar qui�n estaba detr�s?
	};

	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_08"); //Por muchas vueltas que le des, resulta innegable.
	
	//ADDON
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_01"); //�S�lo hay una cosa que no estaba planeada! 
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_02"); //�Has destruido a uno de mis siervos! Lo hab�a elegido para portar la garra.
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_03"); //Ya veo que ahora la llevas t�. �Por este ultraje, pagar�s con la vida!
	
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Ya basta.", DIA_Dragon_Undead_Hello_attack );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "�En nombre de qui�n lideras a tus esbirros en la guerra contra la humanidad?", DIA_Dragon_Undead_Hello_Auftraggeber );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "�Por qu� est�s aqu�?", DIA_Dragon_Undead_Hello_warum );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "�Qui�n eres t�?", DIA_Dragon_Undead_Hello_wer );

	B_LogEntry (TOPIC_HallenVonIrdorath,"El enemigo es un drag�n muerto viviente. Tengo que matarlo antes de poder salir de esta maldita isla."); 
};
func void DIA_Dragon_Undead_Hello_wer ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_00"); //�Qui�n eres t�?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_01"); //(Se r�e) �Y todav�a tienes que preguntarlo? Busca en tu interior, insensato. Ya sabes qui�n soy.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_02"); //No tengo nombre, igual que t�.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_03"); //Mi creador me concedi� poder divino, igual que t� cuentas con el poder de tu dios.

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_04"); //Mi sino es destruir el mundo.
	
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_05"); //Del mismo modo que el tuyo depende de la integridad y la virtud de un palad�n.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_06"); //Del mismo modo que tu mano es mensajera de la muerte, cazador de dragones.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_07"); //Del mismo modo que tu misi�n es predicar la fe de Innos, mago del fuego.
		};

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_08"); //�No sientes el v�nculo que nos une? S�. Sabes qui�n soy.
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_09"); //(Confundido) No. No puede ser. Xardas siempre dijo...
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_10"); //Xardas es d�bil y no supone ninguna amenaza para m�. Solo t� eres un digno adversario.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_11"); //As� est� escrito. Ha llegado la hora de que aceptes tu destino.
	
	

};

func void DIA_Dragon_Undead_Hello_warum ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_warum_15_00"); //�Por qu� est�s aqu�?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_01"); //La divinidad que me ha sido concedida me llevar� a anegar el mundo con una ola de violencia.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_02"); //Solo descansar� cuando haya ca�do la �ltima fortaleza de los justos.

};

func void DIA_Dragon_Undead_Hello_Auftraggeber ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_Auftraggeber_15_00"); //�En nombre de qui�n lideras a tus esbirros en la guerra contra la humanidad?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_01"); //Mi amo es el Se�or de la Noche. Lo conoces, y escuchas su llamada.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_03"); //Mis ej�rcitos se alzar�n de la tierra en su nombre y oscurecer�n el mundo.
};

func void DIA_Dragon_Undead_Hello_attack ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_attack_15_00"); //Basta de charla. Te devolver� a la roca de la que saliste reptando, monstruo.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_01"); //(Se r�e) No est�s preparado para derrotarme. En un instante habr� alcanzado mi meta.
	//ADDON
	if (C_ScHasEquippedBeliarsWeapon())
	|| (C_ScHasReadiedBeliarsWeapon())
	|| (C_ScHasBeliarsRune())
	{
		AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_04"); //�De verdad crees que puedes hacerme da�o con la garra? (risas)
	};
	//ADDON ENDE
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_02"); //Tus huesos me servir�n para que los vientos de la muerte soplen por todo el mundo.
		
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};





