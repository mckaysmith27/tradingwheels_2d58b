import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OpenAI API Group Code

class OpenAIAPIGroup {
  static String getBaseUrl() => 'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
  };
  static CreateChatCompletionCall createChatCompletionCall =
      CreateChatCompletionCall();
  static CreateCompletionCall createCompletionCall = CreateCompletionCall();
  static CreateImageCall createImageCall = CreateImageCall();
  static CreateImageEditCall createImageEditCall = CreateImageEditCall();
  static CreateImageVariationCall createImageVariationCall =
      CreateImageVariationCall();
  static CreateEmbeddingCall createEmbeddingCall = CreateEmbeddingCall();
  static CreateSpeechCall createSpeechCall = CreateSpeechCall();
  static CreateTranscriptionCall createTranscriptionCall =
      CreateTranscriptionCall();
  static CreateTranslationCall createTranslationCall = CreateTranslationCall();
  static ListFilesCall listFilesCall = ListFilesCall();
  static CreateFileCall createFileCall = CreateFileCall();
  static DeleteFileCall deleteFileCall = DeleteFileCall();
  static RetrieveFileCall retrieveFileCall = RetrieveFileCall();
  static DownloadFileCall downloadFileCall = DownloadFileCall();
  static CreateFineTuningJobCall createFineTuningJobCall =
      CreateFineTuningJobCall();
  static ListPaginatedFineTuningJobsCall listPaginatedFineTuningJobsCall =
      ListPaginatedFineTuningJobsCall();
  static RetrieveFineTuningJobCall retrieveFineTuningJobCall =
      RetrieveFineTuningJobCall();
  static ListFineTuningEventsCall listFineTuningEventsCall =
      ListFineTuningEventsCall();
  static CancelFineTuningJobCall cancelFineTuningJobCall =
      CancelFineTuningJobCall();
  static ListFineTuningJobCheckpointsCall listFineTuningJobCheckpointsCall =
      ListFineTuningJobCheckpointsCall();
  static ListModelsCall listModelsCall = ListModelsCall();
  static RetrieveModelCall retrieveModelCall = RetrieveModelCall();
  static DeleteModelCall deleteModelCall = DeleteModelCall();
  static CreateModerationCall createModerationCall = CreateModerationCall();
  static ListAssistantsCall listAssistantsCall = ListAssistantsCall();
  static CreateAssistantCall createAssistantCall = CreateAssistantCall();
  static GetAssistantCall getAssistantCall = GetAssistantCall();
  static ModifyAssistantCall modifyAssistantCall = ModifyAssistantCall();
  static DeleteAssistantCall deleteAssistantCall = DeleteAssistantCall();
  static CreateThreadCall createThreadCall = CreateThreadCall();
  static GetThreadCall getThreadCall = GetThreadCall();
  static ModifyThreadCall modifyThreadCall = ModifyThreadCall();
  static DeleteThreadCall deleteThreadCall = DeleteThreadCall();
  static ListMessagesCall listMessagesCall = ListMessagesCall();
  static CreateMessageCall createMessageCall = CreateMessageCall();
  static GetMessageCall getMessageCall = GetMessageCall();
  static ModifyMessageCall modifyMessageCall = ModifyMessageCall();
  static DeleteMessageCall deleteMessageCall = DeleteMessageCall();
  static CreateThreadAndRunCall createThreadAndRunCall =
      CreateThreadAndRunCall();
  static ListRunsCall listRunsCall = ListRunsCall();
  static CreateRunCall createRunCall = CreateRunCall();
  static GetRunCall getRunCall = GetRunCall();
  static ModifyRunCall modifyRunCall = ModifyRunCall();
  static SubmitToolOuputsToRunCall submitToolOuputsToRunCall =
      SubmitToolOuputsToRunCall();
  static CancelRunCall cancelRunCall = CancelRunCall();
  static ListRunStepsCall listRunStepsCall = ListRunStepsCall();
  static GetRunStepCall getRunStepCall = GetRunStepCall();
  static ListVectorStoresCall listVectorStoresCall = ListVectorStoresCall();
  static CreateVectorStoreCall createVectorStoreCall = CreateVectorStoreCall();
  static GetVectorStoreCall getVectorStoreCall = GetVectorStoreCall();
  static ModifyVectorStoreCall modifyVectorStoreCall = ModifyVectorStoreCall();
  static DeleteVectorStoreCall deleteVectorStoreCall = DeleteVectorStoreCall();
  static ListVectorStoreFilesCall listVectorStoreFilesCall =
      ListVectorStoreFilesCall();
  static CreateVectorStoreFileCall createVectorStoreFileCall =
      CreateVectorStoreFileCall();
  static GetVectorStoreFileCall getVectorStoreFileCall =
      GetVectorStoreFileCall();
  static DeleteVectorStoreFileCall deleteVectorStoreFileCall =
      DeleteVectorStoreFileCall();
  static CreateVectorStoreFileBatchCall createVectorStoreFileBatchCall =
      CreateVectorStoreFileBatchCall();
  static GetVectorStoreFileBatchCall getVectorStoreFileBatchCall =
      GetVectorStoreFileBatchCall();
  static CancelVectorStoreFileBatchCall cancelVectorStoreFileBatchCall =
      CancelVectorStoreFileBatchCall();
  static ListFilesInVectorStoreBatchCall listFilesInVectorStoreBatchCall =
      ListFilesInVectorStoreBatchCall();
  static CreateBatchCall createBatchCall = CreateBatchCall();
  static ListBatchesCall listBatchesCall = ListBatchesCall();
  static RetrieveBatchCall retrieveBatchCall = RetrieveBatchCall();
  static CancelBatchCall cancelBatchCall = CancelBatchCall();
}

class CreateChatCompletionCall {
  Future<ApiCallResponse> call({
    dynamic messagesJson,
    dynamic promptJson,
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final messages = _serializeJson(messagesJson);
    final prompt = _serializeJson(promptJson, true);
    final ffApiRequestBody = '''
{
  "messages": ${prompt},
  "model": "gpt-4o-2024-05-13"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createChatCompletion',
      apiUrl: '${baseUrl}/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateCompletionCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "model": "",
  "prompt": "",
  "best_of": 0,
  "echo": false,
  "frequency_penalty": 0,
  "logit_bias": {},
  "logprobs": 0,
  "max_tokens": 16,
  "n": 1,
  "presence_penalty": 0,
  "seed": 0,
  "stop": "",
  "stream": false,
  "stream_options": {
    "include_usage": false
  },
  "suffix": "test.",
  "temperature": 1,
  "top_p": 1,
  "user": "user-1234"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createCompletion',
      apiUrl: '${baseUrl}/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateImageCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "prompt": "A cute baby sea otter",
  "model": "dall-e-3",
  "n": 1,
  "quality": "standard",
  "response_format": "url",
  "size": "1024x1024",
  "style": "vivid",
  "user": "user-1234"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createImage',
      apiUrl: '${baseUrl}/images/generations',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateImageEditCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'createImageEdit',
      apiUrl: '${baseUrl}/images/edits',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateImageVariationCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'createImageVariation',
      apiUrl: '${baseUrl}/images/variations',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateEmbeddingCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "input": "The quick brown fox jumped over the lazy dog",
  "model": "text-embedding-3-small",
  "encoding_format": "float",
  "dimensions": 0,
  "user": "user-1234"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createEmbedding',
      apiUrl: '${baseUrl}/embeddings',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateSpeechCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "model": "",
  "input": "",
  "voice": "alloy",
  "response_format": "mp3",
  "speed": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createSpeech',
      apiUrl: '${baseUrl}/audio/speech',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateTranscriptionCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'createTranscription',
      apiUrl: '${baseUrl}/audio/transcriptions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateTranslationCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'createTranslation',
      apiUrl: '${baseUrl}/audio/translations',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListFilesCall {
  Future<ApiCallResponse> call({
    String? purpose = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listFiles',
      apiUrl: '${baseUrl}/files',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'purpose': purpose,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateFileCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'createFile',
      apiUrl: '${baseUrl}/files',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deleteFile',
      apiUrl: '${baseUrl}/files/${fileId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'retrieveFile',
      apiUrl: '${baseUrl}/files/${fileId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DownloadFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'downloadFile',
      apiUrl: '${baseUrl}/files/${fileId}/content',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateFineTuningJobCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo",
  "training_file": "file-abc123",
  "hyperparameters": {
    "batch_size": "",
    "learning_rate_multiplier": "",
    "n_epochs": ""
  },
  "suffix": "",
  "validation_file": "file-abc123",
  "integrations": [
    {
      "type": "",
      "wandb": {
        "project": "my-wandb-project",
        "name": "",
        "entity": "",
        "tags": [
          "custom-tag"
        ]
      }
    }
  ],
  "seed": 42
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createFineTuningJob',
      apiUrl: '${baseUrl}/fine_tuning/jobs',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListPaginatedFineTuningJobsCall {
  Future<ApiCallResponse> call({
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listPaginatedFineTuningJobs',
      apiUrl: '${baseUrl}/fine_tuning/jobs',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'after': after,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveFineTuningJobCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'retrieveFineTuningJob',
      apiUrl: '${baseUrl}/fine_tuning/jobs/${fineTuningJobId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListFineTuningEventsCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listFineTuningEvents',
      apiUrl: '${baseUrl}/fine_tuning/jobs/${fineTuningJobId}/events',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'after': after,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelFineTuningJobCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'cancelFineTuningJob',
      apiUrl: '${baseUrl}/fine_tuning/jobs/${fineTuningJobId}/cancel',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListFineTuningJobCheckpointsCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listFineTuningJobCheckpoints',
      apiUrl: '${baseUrl}/fine_tuning/jobs/${fineTuningJobId}/checkpoints',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'after': after,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListModelsCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listModels',
      apiUrl: '${baseUrl}/models',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveModelCall {
  Future<ApiCallResponse> call({
    String? model = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'retrieveModel',
      apiUrl: '${baseUrl}/models/${model}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteModelCall {
  Future<ApiCallResponse> call({
    String? model = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deleteModel',
      apiUrl: '${baseUrl}/models/${model}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateModerationCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "input": "",
  "model": "text-moderation-stable"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createModeration',
      apiUrl: '${baseUrl}/moderations',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListAssistantsCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listAssistants',
      apiUrl: '${baseUrl}/assistants',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateAssistantCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "model": "gpt-4-turbo",
  "name": "",
  "description": "",
  "instructions": "",
  "tools": [
    ""
  ],
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ],
      "vector_stores": [
        {
          "file_ids": [
            ""
          ],
          "chunking_strategy": {},
          "metadata": {}
        }
      ]
    }
  },
  "metadata": {},
  "temperature": 1,
  "top_p": 1,
  "response_format": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createAssistant',
      apiUrl: '${baseUrl}/assistants',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAssistantCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAssistant',
      apiUrl: '${baseUrl}/assistants/${assistantId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModifyAssistantCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "model": "",
  "name": "",
  "description": "",
  "instructions": "",
  "tools": [
    ""
  ],
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ]
    }
  },
  "metadata": {},
  "temperature": 1,
  "top_p": 1,
  "response_format": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modifyAssistant',
      apiUrl: '${baseUrl}/assistants/${assistantId}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteAssistantCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deleteAssistant',
      apiUrl: '${baseUrl}/assistants/${assistantId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateThreadCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "messages": [
    {
      "role": "user",
      "content": "",
      "attachments": [
        {
          "file_id": "",
          "tools": [
            ""
          ]
        }
      ],
      "metadata": {}
    }
  ],
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ],
      "vector_stores": [
        {
          "file_ids": [
            ""
          ],
          "chunking_strategy": {},
          "metadata": {}
        }
      ]
    }
  },
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createThread',
      apiUrl: '${baseUrl}/threads',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetThreadCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getThread',
      apiUrl: '${baseUrl}/threads/${threadId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModifyThreadCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ]
    }
  },
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modifyThread',
      apiUrl: '${baseUrl}/threads/${threadId}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteThreadCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deleteThread',
      apiUrl: '${baseUrl}/threads/${threadId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListMessagesCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? runId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listMessages',
      apiUrl: '${baseUrl}/threads/${threadId}/messages',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
        'run_id': runId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "role": "user",
  "content": "",
  "attachments": [
    {
      "file_id": "",
      "tools": [
        ""
      ]
    }
  ],
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createMessage',
      apiUrl: '${baseUrl}/threads/${threadId}/messages',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getMessage',
      apiUrl: '${baseUrl}/threads/${threadId}/messages/${messageId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModifyMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modifyMessage',
      apiUrl: '${baseUrl}/threads/${threadId}/messages/${messageId}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deleteMessage',
      apiUrl: '${baseUrl}/threads/${threadId}/messages/${messageId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateThreadAndRunCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "assistant_id": "",
  "thread": {
    "messages": [
      {
        "role": "user",
        "content": "",
        "attachments": [
          {
            "file_id": "",
            "tools": [
              ""
            ]
          }
        ],
        "metadata": {}
      }
    ],
    "tool_resources": {
      "code_interpreter": {
        "file_ids": [
          ""
        ]
      },
      "file_search": {
        "vector_store_ids": [
          ""
        ],
        "vector_stores": [
          {
            "file_ids": [
              ""
            ],
            "chunking_strategy": {},
            "metadata": {}
          }
        ]
      }
    },
    "metadata": {}
  },
  "model": "gpt-4-turbo",
  "instructions": "",
  "tools": [
    ""
  ],
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ]
    }
  },
  "metadata": {},
  "temperature": 1,
  "top_p": 1,
  "stream": false,
  "max_prompt_tokens": 0,
  "max_completion_tokens": 0,
  "truncation_strategy": {
    "type": "auto",
    "last_messages": 0
  },
  "tool_choice": "",
  "parallel_tool_calls": false,
  "response_format": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createThreadAndRun',
      apiUrl: '${baseUrl}/threads/runs',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListRunsCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listRuns',
      apiUrl: '${baseUrl}/threads/${threadId}/runs',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "assistant_id": "",
  "model": "gpt-4-turbo",
  "instructions": "",
  "additional_instructions": "",
  "additional_messages": [
    {
      "role": "user",
      "content": "",
      "attachments": [
        {
          "file_id": "",
          "tools": [
            ""
          ]
        }
      ],
      "metadata": {}
    }
  ],
  "tools": [
    ""
  ],
  "metadata": {},
  "temperature": 1,
  "top_p": 1,
  "stream": false,
  "max_prompt_tokens": 0,
  "max_completion_tokens": 0,
  "truncation_strategy": {
    "type": "auto",
    "last_messages": 0
  },
  "tool_choice": "",
  "parallel_tool_calls": false,
  "response_format": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createRun',
      apiUrl: '${baseUrl}/threads/${threadId}/runs',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getRun',
      apiUrl: '${baseUrl}/threads/${threadId}/runs/${runId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModifyRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modifyRun',
      apiUrl: '${baseUrl}/threads/${threadId}/runs/${runId}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubmitToolOuputsToRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "tool_outputs": [
    {
      "tool_call_id": "",
      "output": ""
    }
  ],
  "stream": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submitToolOuputsToRun',
      apiUrl:
          '${baseUrl}/threads/${threadId}/runs/${runId}/submit_tool_outputs',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'cancelRun',
      apiUrl: '${baseUrl}/threads/${threadId}/runs/${runId}/cancel',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListRunStepsCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listRunSteps',
      apiUrl: '${baseUrl}/threads/${threadId}/runs/${runId}/steps',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRunStepCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? stepId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getRunStep',
      apiUrl: '${baseUrl}/threads/${threadId}/runs/${runId}/steps/${stepId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListVectorStoresCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listVectorStores',
      apiUrl: '${baseUrl}/vector_stores',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateVectorStoreCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "file_ids": [
    ""
  ],
  "name": "",
  "expires_after": {
    "anchor": "last_active_at",
    "days": 0
  },
  "chunking_strategy": {},
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createVectorStore',
      apiUrl: '${baseUrl}/vector_stores',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetVectorStoreCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getVectorStore',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModifyVectorStoreCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "",
  "expires_after": {
    "anchor": "last_active_at",
    "days": 0
  },
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modifyVectorStore',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteVectorStoreCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deleteVectorStore',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListVectorStoreFilesCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? filter = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listVectorStoreFiles',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}/files',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateVectorStoreFileCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "file_id": "",
  "chunking_strategy": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createVectorStoreFile',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}/files',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetVectorStoreFileCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? fileId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getVectorStoreFile',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}/files/${fileId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteVectorStoreFileCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? fileId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deleteVectorStoreFile',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}/files/${fileId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateVectorStoreFileBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "file_ids": [
    ""
  ],
  "chunking_strategy": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createVectorStoreFileBatch',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}/file_batches',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetVectorStoreFileBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? batchId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getVectorStoreFileBatch',
      apiUrl:
          '${baseUrl}/vector_stores/${vectorStoreId}/file_batches/${batchId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelVectorStoreFileBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? batchId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'cancelVectorStoreFileBatch',
      apiUrl:
          '${baseUrl}/vector_stores/${vectorStoreId}/file_batches/${batchId}/cancel',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListFilesInVectorStoreBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? batchId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? filter = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listFilesInVectorStoreBatch',
      apiUrl:
          '${baseUrl}/vector_stores/${vectorStoreId}/file_batches/${batchId}/files',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateBatchCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "input_file_id": "",
  "endpoint": "/v1/chat/completions",
  "completion_window": "24h",
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createBatch',
      apiUrl: '${baseUrl}/batches',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListBatchesCall {
  Future<ApiCallResponse> call({
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listBatches',
      apiUrl: '${baseUrl}/batches',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'after': after,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveBatchCall {
  Future<ApiCallResponse> call({
    String? batchId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'retrieveBatch',
      apiUrl: '${baseUrl}/batches/${batchId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelBatchCall {
  Future<ApiCallResponse> call({
    String? batchId = '',
    String? apiKeyAuth = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'cancelBatch',
      apiUrl: '${baseUrl}/batches/${batchId}/cancel',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk-proj-SGG0GDvk44LdBrPbNJWFT3BlbkFJ30161yeotY2teoQUEAVf',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End OpenAI API Group Code

class SendInputGetResponseCall {
  static Future<ApiCallResponse> call({
    String? phase = 'welcome',
    String? intent = 'post',
    String? userInput = 'default user input',
    String? mc = 'range',
    String? tradeType = 'squeeze breakout',
    String? username = '',
  }) async {
    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "intent": "${intent}",
    "phase": "${phase}",
    "user_input": "${userInput}"
    }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendInputGetResponse',
      apiUrl:
          'https://w03g5jqczl.execute-api.us-east-2.amazonaws.com/default_stage/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic all(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  static dynamic body(dynamic response) => getJsonField(
        response,
        r'''$.body''',
      );
  static int? statuscode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static dynamic phases(dynamic response) => getJsonField(
        response,
        r'''$.body.input_data''',
      );
  static int? ordercount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.body.order_count''',
      ));
  static List<String>? p2r(dynamic response) => (getJsonField(
        response,
        r'''$.body.parent_phases.phases_to_run''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? scalecount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.body.scale_count''',
      ));
  static int? startingacctbal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.body.starting_account_balance''',
      ));
  static dynamic rationalstates(dynamic response) => getJsonField(
        response,
        r'''$.body.tracker_dicts.rational_states''',
      );
  static dynamic irrationalstates(dynamic response) => getJsonField(
        response,
        r'''$.body.tracker_dicts.irrational_states''',
      );
  static dynamic trackerdicts(dynamic response) => getJsonField(
        response,
        r'''$.body.tracker_dicts''',
      );
  static dynamic timing(dynamic response) => getJsonField(
        response,
        r'''$.body.tracker_dicts.timing''',
      );
  static dynamic mcstrats(dynamic response) => getJsonField(
        response,
        r'''$.body.trading_strategies.market_conditions''',
      );
  static dynamic strats(dynamic response) => getJsonField(
        response,
        r'''$.body.trading_strategies''',
      );
  static dynamic rangestrats(dynamic response) => getJsonField(
        response,
        r'''$.body.trading_strategies.market_conditions.range''',
      );
  static List<String>? lsttest(dynamic response) => (getJsonField(
        response,
        r'''$.body.*.*''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? ordtaglists(dynamic response) => getJsonField(
        response,
        r'''$.body.order_tags..list''',
        true,
      ) as List?;
}

class PlaceOrderAndDataAnalysisCall {
  static Future<ApiCallResponse> call({
    String? username = 'uNFYlo53gGVPmZCmwQ3eEjk7Tcz1',
    String? intent = 'post',
    String? phase = 'trade',
    dynamic ohlcCsvNowJsonJson,
    dynamic ordersCsvNowJsonJson,
    String? userInputStr = 'mosell wedge reversal',
    dynamic userInputJsonListJson,
    dynamic userDataJson,
    dynamic manualAcctSettingsJsonListJson,
    double? challStartAcctBal,
    double? mornAcctBal,
    double? currAcctBal,
    double? maxRiskPercCap,
    double? brokCommFee,
    double? brokSpreadFee,
    double? accountAggressionLevel = 0.2,
    String? selectedBroker = 'None',
  }) async {
    final ohlcCsvNowJson = _serializeJson(ohlcCsvNowJsonJson);
    final ordersCsvNowJson = _serializeJson(ordersCsvNowJsonJson);
    final userInputJsonList = _serializeJson(userInputJsonListJson, true);
    final userData = _serializeJson(userDataJson);
    final manualAcctSettingsJsonList =
        _serializeJson(manualAcctSettingsJsonListJson, true);
    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "intent": "${intent}",
    "phase": "${phase}",
    "ohlc_data": ${ohlcCsvNowJson},
    "orders_data": ${ordersCsvNowJson},
    "user_input_string": "${userInputStr}",
    "user_input_json_list": ${userInputJsonList},
    "selected_broker": "${selectedBroker}",
    "original_starting_account_balance": "${challStartAcctBal}",
    "todays_starting_account_balance": "${mornAcctBal}",
    "current_account_bal": "${currAcctBal}",
    "acct_max_risk_perc_per_trade": "${maxRiskPercCap}",
    "avg_comm_fee_doll": "${brokCommFee}",
    "avg_spread_fee_doll": "${brokSpreadFee}",
    "account_aggression_level": "${accountAggressionLevel}"
    }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PlaceOrderAndDataAnalysis',
      apiUrl: 'https://cxscdgdkl9.execute-api.us-east-2.amazonaws.com/def',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CSVMergingCall {
  static Future<ApiCallResponse> call({
    List<String>? docsList,
  }) async {
    final docs = _serializeList(docsList);

    final ffApiRequestBody = '''
{
  "body": {
    "username": "uNFYlo53gGVPmZCmwQ3eEjk7Tcz1",
    "func": "multiple_csvs_to_one",
    "path": ${docs},
    "data": [
      {
        "key1": "value1"
      },
      {
        "key2": "value2"
      },
      {
        "key3": "value3"
      }
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CSVMerging',
      apiUrl:
          'https://lzhs6mqaqg.execute-api.us-east-2.amazonaws.com/csv_Combiner',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmallScaleActionsRtdbDataDictValsStrListCall {
  static Future<ApiCallResponse> call({
    String? dataK = 'k1_test',
    List<String>? dataVList,
    String? path = '',
    String? func = '',
    String? username = 'uNFYlo53gGVPmZCmwQ3eEjk7Tcz1',
  }) async {
    final dataV = _serializeList(dataVList);

    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "func": "${func}",
    "path": "${path}",
    "data": {
      "${dataK}": "${dataV}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smallScaleActionsRtdbDataDictValsStrList',
      apiUrl:
          'https://s4faa9mnza.execute-api.us-east-2.amazonaws.com/default/e70613312T',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmallScaleActionsRtdbDataDictValsStrCall {
  static Future<ApiCallResponse> call({
    String? dataK = 'k1_test',
    String? dataV = 'v1_test',
    String? path = '',
    String? func = '',
    String? username = 'uNFYlo53gGVPmZCmwQ3eEjk7Tcz1',
  }) async {
    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "func": "${func}",
    "path": "${path}",
    "data": {
      "${dataK}": "${dataV}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smallScaleActionsRtdbDataDictValsStr',
      apiUrl:
          'https://s4faa9mnza.execute-api.us-east-2.amazonaws.com/default/e70613312T',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmallScaleActionsRtdbDataDictValsFloatCall {
  static Future<ApiCallResponse> call({
    String? dataK = '',
    double? dataV,
    String? path = '',
    String? func = '',
    String? username = 'uNFYlo53gGVPmZCmwQ3eEjk7Tcz1',
  }) async {
    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "func": "${func}",
    "path": "${path}",
    "data": {
      "${dataK}": ${dataV}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smallScaleActionsRtdbDataDictValsFloat',
      apiUrl:
          'https://s4faa9mnza.execute-api.us-east-2.amazonaws.com/default/e70613312T',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmallScaleActionsRtdbDataDictValsFloatListCall {
  static Future<ApiCallResponse> call({
    String? dataK = '',
    List<double>? dataVList,
    String? path = '',
    String? func = '',
    String? username = 'uNFYlo53gGVPmZCmwQ3eEjk7Tcz1',
  }) async {
    final dataV = _serializeList(dataVList);

    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "func": "${func}",
    "path": "${path}",
    "data": {
      "${dataK}": ${dataV}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smallScaleActionsRtdbDataDictValsFloatList',
      apiUrl:
          'https://s4faa9mnza.execute-api.us-east-2.amazonaws.com/default/e70613312T',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmallScaleActionsRtdbDataDictValsIntListCall {
  static Future<ApiCallResponse> call({
    String? dataK = '',
    List<int>? dataVList,
    String? path = '',
    String? func = '',
    String? username = 'uNFYlo53gGVPmZCmwQ3eEjk7Tcz1',
  }) async {
    final dataV = _serializeList(dataVList);

    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "func": "${func}",
    "path": "${path}",
    "data": {
      "${dataK}": ${dataV}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smallScaleActionsRtdbDataDictValsIntList',
      apiUrl:
          'https://s4faa9mnza.execute-api.us-east-2.amazonaws.com/default/e70613312T',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmallScaleActionsRtdbDataDictValsBolCall {
  static Future<ApiCallResponse> call({
    String? dataK = '',
    bool? dataV = false,
    String? path = '',
    String? func = '',
    String? username = 'uNFYlo53gGVPmZCmwQ3eEjk7Tcz1',
  }) async {
    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "func": "${func}",
    "path": "${path}",
    "data": {
      "${dataK}": ${dataV}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smallScaleActionsRtdbDataDictValsBol',
      apiUrl:
          'https://s4faa9mnza.execute-api.us-east-2.amazonaws.com/default/e70613312T',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmallScaleActionsRtdbDataDictValsBolListCall {
  static Future<ApiCallResponse> call({
    String? dataK = '',
    List<bool>? dataVList,
    String? path = '',
    String? func = '',
    String? username = 'uNFYlo53gGVPmZCmwQ3eEjk7Tcz1',
  }) async {
    final dataV = _serializeList(dataVList);

    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "func": "${func}",
    "path": "${path}",
    "data": {
      "${dataK}": ${dataV}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smallScaleActionsRtdbDataDictValsBolList',
      apiUrl:
          'https://s4faa9mnza.execute-api.us-east-2.amazonaws.com/default/e70613312T',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmallScaleActionsRtdbDataDictValsIntCall {
  static Future<ApiCallResponse> call({
    String? dataK = '',
    int? dataV,
    String? path = '',
    String? func = '',
    String? username = 'uNFYlo53gGVPmZCmwQ3eEjk7Tcz1',
  }) async {
    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "func": "${func}",
    "path": "${path}",
    "data": {
      "${dataK}": ${dataV}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smallScaleActionsRtdbDataDictValsInt',
      apiUrl:
          'https://s4faa9mnza.execute-api.us-east-2.amazonaws.com/default/e70613312T',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmallScaleActionsRtdbValsJsonCall {
  static Future<ApiCallResponse> call({
    String? k = '',
    String? path = '',
    String? func = '',
    String? username = 'uNFYlo53gGVPmZCmwQ3eEjk7Tcz1',
    dynamic vJsonJson,
  }) async {
    final vJson = _serializeJson(vJsonJson);
    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "func": "${func}",
    "path": "${path}",
    "k": ${vJson}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smallScaleActionsRtdbValsJson',
      apiUrl:
          'https://s4faa9mnza.execute-api.us-east-2.amazonaws.com/default/e70613312T',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmallScaleActionsRtdbDataKeysListValsListStrsCall {
  static Future<ApiCallResponse> call({
    List<String>? keysListList,
    List<String>? valsListList,
    String? func = '',
    String? username = 'uNFYlo53gGVPmZCmwQ3eEjk7Tcz1',
    String? path = '',
  }) async {
    final keysList = _serializeList(keysListList);
    final valsList = _serializeList(valsListList);

    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "func": "${func}",
    "path": "${path}",
    "data": {
      "keys": ${keysList},
      "vals": ${valsList}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smallScaleActionsRtdbDataKeysListValsListStrs',
      apiUrl:
          'https://s4faa9mnza.execute-api.us-east-2.amazonaws.com/default/e70613312T',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmallScaleActionsRtdbDataKeysListValsListIntsCall {
  static Future<ApiCallResponse> call({
    List<String>? keysListList,
    List<int>? valsListList,
    String? func = '',
    String? username = 'uNFYlo53gGVPmZCmwQ3eEjk7Tcz1',
    String? path = '',
  }) async {
    final keysList = _serializeList(keysListList);
    final valsList = _serializeList(valsListList);

    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "func": "${func}",
    "path": "${path}",
    "data": {
      "keys": ${keysList},
      "vals": ${valsList}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smallScaleActionsRtdbDataKeysListValsListInts',
      apiUrl:
          'https://s4faa9mnza.execute-api.us-east-2.amazonaws.com/default/e70613312T',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmallScaleActionsRtdbKeyValStrCall {
  static Future<ApiCallResponse> call({
    String? key = '',
    String? val = '',
    String? func = '',
    String? username = 'uNFYlo53gGVPmZCmwQ3eEjk7Tcz1',
    String? path = '',
  }) async {
    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "func": "${func}",
    "path": "${path}",
    "${key}":"${val}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smallScaleActionsRtdbKeyValStr',
      apiUrl:
          'https://s4faa9mnza.execute-api.us-east-2.amazonaws.com/default/e70613312T',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmallScaleActionsRtdbKeyValStrListCall {
  static Future<ApiCallResponse> call({
    String? key = '',
    String? val = '',
    String? func = '',
    String? username = 'uNFYlo53gGVPmZCmwQ3eEjk7Tcz1',
    String? path = '',
  }) async {
    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "func": "${func}",
    "path": "${path}",
    "${key}":"${val}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smallScaleActionsRtdbKeyValStrList',
      apiUrl:
          'https://s4faa9mnza.execute-api.us-east-2.amazonaws.com/default/e70613312T',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmallScaleActionsRtdbDataKeysListValsListFloatsCopyCall {
  static Future<ApiCallResponse> call({
    List<String>? keysListList,
    List<double>? valsListList,
    String? func = '',
    String? username = 'uNFYlo53gGVPmZCmwQ3eEjk7Tcz1',
    String? path = '',
  }) async {
    final keysList = _serializeList(keysListList);
    final valsList = _serializeList(valsListList);

    final ffApiRequestBody = '''
{
  "body": {
    "username": "${username}",
    "func": "${func}",
    "path": "${path}",
    "data": {
      "keys": ${keysList},
      "vals": ${valsList}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smallScaleActionsRtdbDataKeysListValsListFloats Copy',
      apiUrl:
          'https://s4faa9mnza.execute-api.us-east-2.amazonaws.com/default/e70613312T',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SetRTDBCall {
  static Future<ApiCallResponse> call({
    String? k = 'k1_test',
    String? v = 'v1_test',
  }) async {
    final ffApiRequestBody = '''
{
  "body": {
    "username": "uNFYlo53gGVPmZCmwQ3eEjk7Tcz1",
    "func": "set_rtdb",
    "path": "/trading_settings",
    "data": {
      "${k}": "${v}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'setRTDB',
      apiUrl:
          'https://s4faa9mnza.execute-api.us-east-2.amazonaws.com/default/e70613312T',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LargeScaleDatabaseActionsRTDBCall {
  static Future<ApiCallResponse> call({
    String? func = '',
  }) async {
    final ffApiRequestBody = '''
{
  "body": {
    "username": "uNFYlo53gGVPmZCmwQ3eEjk7Tcz1",
    "func": "${func}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LargeScaleDatabaseActionsRTDB',
      apiUrl:
          'https://x511rl1xja.execute-api.us-east-2.amazonaws.com/default/TW_generate_new_db',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSizeCall {
  static Future<ApiCallResponse> call({
    double? currBal,
    double? dlyBal,
    double? origBal,
    int? gradeDivisor = 5,
    int? timingDivisor = 5,
  }) async {
    final ffApiRequestBody = '''
{
  "body": {
    "username": "uNFYlo53gGVPmZCmwQ3eEjk7Tcz1",
    "is_new_day": true,
    "curr_bal": ${currBal},
    "dly_bal": ${dlyBal},
    "orig_bal": ${origBal},
    "broker_firm": "forex_dot_com_400",
    "instrument": "EURUSD",
    "sl_pips": 10,
    "side": "buy",
    "mr_ops": [
      {
        "-": {
          "smbuff": 0.003
        }
      },
      {
        "/": {
          "t_grade": ${gradeDivisor}
        }
      },
      {
        "/": {
          "timing_agg": ${timingDivisor}
        }
      }
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetSize',
      apiUrl: 'https://hchw9yxf52.execute-api.us-east-2.amazonaws.com/stager/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? szUnits(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.body.units''',
      ));
  static double? currBal(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.body.bals_dict.curr_bal''',
      ));
  static double? dlyBal(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.body.bals_dict.dly_bal''',
      ));
  static double? origBal(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.body.bals_dict.orig_bal''',
      ));
}

class GetSizePgLoadCall {
  static Future<ApiCallResponse> call({
    double? currBal,
    double? dlyBal,
    double? origBal,
    int? gradeDivisor = 5,
    int? timingDivisor = 5,
  }) async {
    final ffApiRequestBody = '''
{
  "body": {
    "username": "uNFYlo53gGVPmZCmwQ3eEjk7Tcz1",
    "is_new_day": true,
    "curr_bal": ${currBal},
    "dly_bal": ${dlyBal},
    "orig_bal": ${origBal},
    "broker_firm": "forex_dot_com_400",
    "instrument": "EURUSD",
    "sl_pips": 10,
    "side": "buy",
    "mr_ops": [
      {
        "-": {
          "smbuff": 0.003
        }
      },
      {
        "/": {
          "t_grade": ${gradeDivisor}
        }
      },
      {
        "/": {
          "timing_agg": ${timingDivisor}
        }
      }
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetSizePgLoad',
      apiUrl: 'https://hchw9yxf52.execute-api.us-east-2.amazonaws.com/stager/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? szUnits(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.body.units''',
      ));
  static double? currBal(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.body.bals_dict.curr_bal''',
      ));
  static double? dlyBal(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.body.bals_dict.dly_bal''',
      ));
  static double? origBal(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.body.bals_dict.orig_bal''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
