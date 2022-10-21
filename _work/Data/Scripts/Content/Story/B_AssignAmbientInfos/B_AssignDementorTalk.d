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
			AI_Output			(self ,other, "DIA_VinoDementor_19_00"); //Sei venuto per interrompere il nostro rituale? La sua anima ora appartiene a noi, mago. Non puoi più salvarlo.
		}
	else if (CurrentLevel == DRAGONISLAND_ZEN)
		{
			if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DragonIsle_Keymaster))
				{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_01"); //(ride) Sei venuto per sfidare me e il mio lavoro? Sei condannato a fallire.
						AI_Output			(self ,other, "DIA_AmbientDementor_19_02"); //Nessuno è mai riuscito a oltrepassare la mia cripta. Torna indietro, perché nemmeno tu riuscirai a raggiungere le sacre Sale di Irdorath.
				}
				else
				{	
				 	if (randy == 0)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_03"); //Hai fatto già troppa strada, lurido verme. Non raggiungerai mai il nostro santuario interno.
					};
					if (randy == 1)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_04"); //Resta dove sei. Non muoverti!
					};
					if (randy == 2)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_05"); //Sei arrivato fin qui, ma non riuscirai a passare oltre.
					};
					if (randy == 3)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_06"); //Sei venuto per sfidare il Padrone, ma prima dovrai superare me.
					};
				};	
		}
	else if (hero.guild == GIL_KDF)
		{
		 	if (randy == 0)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_07"); //Piccolo mago insignificante, non riuscirai mai a eguagliare il potere del Padrone.
			};
			if (randy == 1)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_08"); //Hai scelto la strada della magia per batterci. Una mossa saggia, ma neanche questo ti servirà.
			};
			if (randy == 2)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_09"); //Non ci fermerai neanche con la magia.
			};
			if (randy == 3)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_10"); //Il mio Padrone ti distruggerà. La tua patetica magia da quattro soldi non ti salverà.
			};
		}
	else
		{	
		 	if (randy == 0)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_11"); //Arrenditi, finché sei in tempo. Non puoi fuggire.
			};
			if (randy == 1)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_12"); //Ora assaggerai la forza del Padrone. Non puoi sfuggirgli.
			};
			if (randy == 2)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_13"); //Il mio Padrone vuole la tua testa. Ora niente potrà salvarti.
			};
			if (randy == 3)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_14"); //Sei caduto nella nostra trappola e ora morirai.
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
