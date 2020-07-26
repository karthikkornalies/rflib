/*
 * Copyright (c) 2019 Johannes Fischer <fischer.jh@gmail.com>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of mosquitto nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
@isTest
@SuppressWarnings('PMD.ClassNamingConventions')
private class rflib_LoggerFlowActionTest {
    
    private static final rflib_TestLoggerFactory loggerFactory = new rflib_TestLoggerFactory();

    @IsTest
    private static void testLogMessage_Fatal() {
        rflib_LoggerFlowAction.loggerFactory = loggerFactory;

        rflib_LoggerFlowAction.logMessage(createMessageInfo('fatal'));

        System.assert(loggerFactory.debugLogCapture.containsInAnyMessage('FATAL'), 'debugLogger did not contain FATAL message'); 
    }
    
    @IsTest
    private static void testLogMessage_Error() {
        rflib_LoggerFlowAction.loggerFactory = loggerFactory;

        rflib_LoggerFlowAction.logMessage(createMessageInfo('error'));

        System.assert(loggerFactory.debugLogCapture.containsInAnyMessage('ERROR'), 'debugLogger did not contain FATAL message');
    }

    @IsTest
    private static void testLogMessage_Warn() {
        rflib_LoggerFlowAction.loggerFactory = loggerFactory;

        rflib_LoggerFlowAction.logMessage(createMessageInfo('warn'));

        System.assert(loggerFactory.debugLogCapture.containsInAnyMessage('WARN'), 'debugLogger did not contain FATAL message');
    }

    @IsTest
    private static void testLogMessage_Info() {
        rflib_LoggerFlowAction.loggerFactory = loggerFactory;

        rflib_LoggerFlowAction.logMessage(createMessageInfo('info'));

        System.assert(loggerFactory.debugLogCapture.containsInAnyMessage('INFO'), 'debugLogger did not contain FATAL message');
    }

    @IsTest
    private static void testLogMessage_Debug() {
        rflib_TestLoggerFactory debugLogFactory = new rflib_TestLoggerFactory(rflib_LogLevel.DEBUG);
        rflib_LoggerFlowAction.loggerFactory = debugLogFactory;

        rflib_LoggerFlowAction.logMessage(createMessageInfo('debug'));

        System.assert(debugLogFactory.debugLogCapture.containsInAnyMessage('DEBUG'), 'debugLogger did not contain FATAL message');
    }

    @IsTest
    private static void testLogMessage_UnknownLogLevel() {
        rflib_TestLoggerFactory debugLogFactory = new rflib_TestLoggerFactory(rflib_LogLevel.DEBUG);
        rflib_LoggerFlowAction.loggerFactory = debugLogFactory;

        rflib_LoggerFlowAction.logMessage(createMessageInfo('foobar'));

        System.assert(debugLogFactory.debugLogCapture.containsInAnyMessage('DEBUG'), 'debugLogger did not contain FATAL message');
    }

    private static List<rflib_LoggerFlowAction.LogMessageInfo> createMessageInfo(String logLevel) {
        rflib_LoggerFlowAction.LogMessageInfo result = new rflib_LoggerFlowAction.LogMessageInfo();

        result.context = 'rflib_LoggerFlowActionTest';
        result.logLevel = logLevel;
        result.message = 'This is a message';

        return new List<rflib_LoggerFlowAction.LogMessageInfo> { result };
    }
    
}