// ************************************************************
// 	     EXIT 
// ************************************************************

INSTANCE DIA_AmbientDementor_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_AmbientDementor_EXIT_Condition;
	information	= DIA_AmbientDementor_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_AmbientDementor_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_AmbientDementor_EXIT_Info()
{	
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos (self);
	B_SCIsObsessed (self);
	Npc_SetRefuseTalk (self,5);	
	Snd_Play 	("MFX_FEAR_CAST" );

	if (	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino1))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino2))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino3))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4)))
			{
				DMT_Vino1.aivar[AIV_EnemyOverride] = FALSE;
				DMT_Vino2.aivar[AIV_EnemyOverride] = FALSE;
				DMT_Vino3.aivar[AIV_EnemyOverride] = FALSE;
				DMT_Vino4.aivar[AIV_EnemyOverride] = FALSE;
			}
			else
			{
			B_Attack (self, other, AR_SuddenEnemyInferno, 1);
			};
};	
///////////////////////////////////////////////////////////////////////
//	AmbientDementor Info
///////////////////////////////////////////////////////////////////////
instance DIA_AmbientDementor		(C_INFO)
{
	nr		 	= 	1;
	condition	= 	DIA_AmbientDementor_Condition;
	information	= 	DIA_AmbientDementor_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_AmbientDementor_Condition ()
{
	if (Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};	
};

func void DIA_AmbientDementor_Info ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	

		var int randy;
		randy = Hlp_Random (4);
	
		
	if (	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino1))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino2))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino3))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4)))
		{	
			AI_Output			(self ,other, "DIA_VinoDementor_19_00"); //¿Has venido para interrumpir el ritual? Su alma nos pertenece. Ya no puedes salvarlo, mago.
		}
	else if (CurrentLevel == DRAGONISLAND_ZEN)
		{
			if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DragonIsle_Keymaster))
				{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_01"); //(Se ríe) ¿Has venido a retarme y a desafiar mi obra? Estás condenado a fracasar.
						AI_Output			(self ,other, "DIA_AmbientDementor_19_02"); //Nadie ha conseguido atravesar mi cripta. Date la vuelta, ya que no vas a llegar a los sagrados salones de Irdorath.
				}
				else
				{	
				 	if (randy == 0)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_03"); //Ya has avanzado demasiado, vil gusano. Jamás llegarás a nuestro santuario.
					};
					if (randy == 1)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_04"); //Quieto. No des ni un paso más.
					};
					if (randy == 2)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_05"); //Has llegado hasta aquí, pero no voy a dejarte pasar.
					};
					if (randy == 3)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_06"); //Has venido a desafiar al maestro, pero antes tienes que superarme.
					};
				};	
		}
	else if (hero.guild == GIL_KDF)
		{
		 	if (randy == 0)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_07"); //Magicucho de pacotilla, jamás estarás a la altura del poder del maestro.
			};
			if (randy == 1)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_08"); //Has escogido la senda de la magia para derrotarnos. Fue una maniobra inteligente, pero no te va a servir de nada.
			};
			if (randy == 2)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_09"); //Aunque seas mago, no podrás detenernos.
			};
			if (randy == 3)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_10"); //Mi maestro te destruirá. Tu penosa magia de salón no va a salvarte.
			};
		}
	else
		{	
		 	if (randy == 0)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_11"); //Ríndete mientras puedas. No tienes escapatoria.
			};
			if (randy == 1)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_12"); //Ahora vas a sentir el poder del maestro. No puedes eludirlo.
			};
			if (randy == 2)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_13"); //El maestro quiere tu cabeza. Nadie va a salvarte.
			};
			if (randy == 3)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_14"); //Has caído en nuestra trampa, y ahora acabaremos contigo.
			};
		};
};


func void B_AssignDementorTalk (var C_Npc slf)
{	
	if 	(slf.guild == GIL_DMT)
	&&	(slf.npctype == NPCTYPE_AMBIENT)
	{
		DIA_AmbientDementor_EXIT.npc	= Hlp_GetInstanceID(slf);
		DIA_AmbientDementor.npc			= Hlp_GetInstanceID(slf);
	};
};	
